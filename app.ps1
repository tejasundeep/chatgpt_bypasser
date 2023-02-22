$input = $args[0]
Write-Host "`n[+] Input: $input`n[+] Output:"
$headers = @{
    'Content-Type' = 'application/json'
    'Authorization' = "Bearer $env:CHATGPT_TOKEN"
}

$body = @{
    prompt = $input
    model = "text-davinci-003"
    max_tokens = 4000
    temperature = 1.0
}

$response = Invoke-RestMethod -Uri "https://api.openai.com/v1/completions" -Method POST -Headers $headers -Body (ConvertTo-Json $body)

$response.choices.text
