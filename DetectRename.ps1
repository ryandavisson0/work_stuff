$taskName = "RenameVDD2HookUmode"
$task = Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue
if ($task) {
    exit 0
} else {
    exit 1
}
