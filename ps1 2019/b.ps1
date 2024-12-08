# Sorok olvasása a pipeline-ról
$input | ForEach-Object {
    $count = $_
    # Ismétlés a '#' karakterrel
    '#' * $count
}