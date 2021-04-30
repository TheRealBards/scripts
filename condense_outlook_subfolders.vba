' Reference: https://www.datanumen.com/blogs/batch-move-emails-subfolders-one-folder-another-folder-outlook/
' Usage:
'     * Select the parent folder containing the subfolders.
'     * Select the target folder where you want to move the items to.


Dim objTargetFolder As Outlook.Folder

Sub BatchMoveEmailsFromSubfoldersToAnotherFolder()
    Dim objSourceFolder As Outlook.Folder
    Dim objFolder As Outlook.Folder
  
    'Get the source folder whose subfolders to be processed
    Set objSourceFolder = Application.Session.PickFolder
 
    If Not (objSourceFolder Is Nothing) And objSourceFolder.DefaultItemType = olMailItem Then
       If objSourceFolder.Folders.Count > 0 Then
          'Select a target folder
          Set objTargetFolder = Application.Session.PickFolder
          If Not (objTargetFolder Is Nothing) Then
             For Each objFolder In objSourceFolder.Folders
                 Call ProcessFolders(objFolder)
                 MsgBox "Delete " + objFolder.Name
             Next
             MsgBox "Move Completed!", vbExclamation
          End If
       Else
          MsgBox "No subfolders!", vbExclamation
       End If
    End If
End Sub

Sub ProcessFolders(ByVal objFolder As Outlook.Folder)
    Dim i As Long
    Dim objSubfolder As Outlook.Folder
 
    For i = objFolder.Items.Count To 1 Step -1
        'Move emails to the target folder
        If objFolder.Items(i).Class = olMail Then
           objFolder.Items(i).Move objTargetFolder
        End If
    Next
 
    'Process subfolders recursively
    If objFolder.Folders.Count > 0 Then
       For Each objSubfolder In objFolder.Folders
           Call ProcessFolders(objSubfolder)
       Next
    End If
End Sub
