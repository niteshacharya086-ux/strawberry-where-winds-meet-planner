$ErrorActionPreference = 'Stop'
$plannerPath = Join-Path $PSScriptRoot 'index.html'
$port = 8765

if (-not (Test-Path -LiteralPath $plannerPath -PathType Leaf)) {
  throw "Planner file not found: $plannerPath"
}

$listener = [System.Net.Sockets.TcpListener]::new([System.Net.IPAddress]::Loopback, $port)
try {
  $listener.Start()
  $url = "http://127.0.0.1:$port/"
  Write-Host "Planner running at $url"
  Write-Host 'Keep this window open while using the planner. Press Ctrl+C to stop it.'
  Start-Process $url

  while ($true) {
    $client = $listener.AcceptTcpClient()
    try {
      $stream = $client.GetStream()
      $buffer = [byte[]]::new(8192)
      $count = $stream.Read($buffer, 0, $buffer.Length)
      $request = [System.Text.Encoding]::ASCII.GetString($buffer, 0, $count)
      $requestParts = (($request -split "`r?`n", 2)[0]) -split ' ', 3
      $method = $requestParts[0]
      $target = if ($requestParts.Length -gt 1) { ($requestParts[1] -split '\?', 2)[0] } else { '' }

      if ($method -ne 'GET' -and $method -ne 'HEAD') {
        $body = [System.Text.Encoding]::UTF8.GetBytes('Method not allowed')
        $status = '405 Method Not Allowed'
      } elseif ($target -ne '/' -and $target -ne '/index.html') {
        $body = [System.Text.Encoding]::UTF8.GetBytes('Not found')
        $status = '404 Not Found'
      } else {
        $body = [System.IO.File]::ReadAllBytes($plannerPath)
        $status = '200 OK'
      }

      $headers = "HTTP/1.1 $status`r`nContent-Type: text/html; charset=utf-8`r`nContent-Length: $($body.Length)`r`nReferrer-Policy: origin`r`nConnection: close`r`n`r`n"
      $headerBytes = [System.Text.Encoding]::ASCII.GetBytes($headers)
      $stream.Write($headerBytes, 0, $headerBytes.Length)
      if ($method -ne 'HEAD') { $stream.Write($body, 0, $body.Length) }
      $stream.Flush()
    } catch {
      Write-Warning "Local browser request failed: $($_.Exception.Message)"
    } finally {
      $client.Dispose()
    }
  }
} finally {
  $listener.Stop()
}
