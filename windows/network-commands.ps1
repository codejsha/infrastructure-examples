######################################################################

### get request
Invoke-RestMethod -Uri https://petstore3.swagger.io/api/v3/openapi.json
irm https://petstore3.swagger.io/api/v3/openapi.json

######################################################################

### login request example

$uri  = "http://localhost:8080/auth/login"
$body = @{
  email    = "YOUR_EMAIL"
  password = "YOUR_PASSWORD"
} | ConvertTo-Json
$params = @{
  Method      = 'Post'
  Uri         = $uri
ContentType = 'application/json'
  Body        = $body
}

Invoke-RestMethod @params
Invoke-RestMethod -Method Post -Uri $uri -ContentType "application/json" -Body $body
Invoke-RestMethod -Method Post -Uri $uri -ContentType "application/json" -Body $body | ConvertTo-Json

Invoke-WebRequest @params -WebSession $session -Verbose
(Invoke-WebRequest @params -WebSession $session).Content

$r = Invoke-WebRequest @params -WebSession $session
### print raw response content
$r.RawContent | Out-String -Width 10000
### print response headers
$r.Headers
### print set-cookie header
$r.Headers['Set-Cookie']

### extract refresh token from set-cookie header
$setCookies = $r.Headers['Set-Cookie']
$refreshToken = (($setCookies | Where-Object { $_ -match '^refresh_token=' } | Select-Object -First 1) `
  -replace '^refresh_token=([^;]+).*$','$1')
