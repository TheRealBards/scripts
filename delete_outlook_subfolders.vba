' Reference: https://www.extendoffice.com/documents/outlook/4065-outlook-delete-multiple-folders.html
' changes: uses the PickFolder option instead of CurrentFolder. Less mistakes that way :)

' Usage:
'     Pick the Parent folder containing the subfolders that you want to delete.

Sub Delete_All_SubFolders()
    Dim oCurrFolder As Folder
    Dim oSubFolders As Folders
    Dim i As Long
     
    On Error Resume Next
     
    Set oCurrFolder = Application.Session.PickFolder
    Set oSubFolders = oCurrFolder.Folders
 
    For i = oSubFolders.Count To 1 Step -1
        oSubFolders.Item(i).Delete
    Next
End Sub
