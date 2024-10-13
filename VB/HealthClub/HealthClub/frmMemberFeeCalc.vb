Public Class frmClubMembership

    Private Sub btnCalc_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCalc.Click
        Dim decBaseFee As Decimal
        Dim decTotalFee As Decimal
        Dim intMonths As Integer

        Const decADULT_FEE As Decimal = 40D
        Const decCHILD_FEE As Decimal = 20D
        Const decSTUDENT_FEE As Decimal = 25D
        Const decSENIOR_FEE As Decimal = 30D

        Const decYOGA_FEE As Decimal = 10D
        Const decKARATE_FEE As Decimal = 30D
        Const decTRAINER_FEE As Decimal = 50D

        If Integer.TryParse(txtMoNo.Text, intMonths) Then
            If intMonths >= 1 And intMonths <= 24 Then
                If radAdult.Checked = True Then
                    decBaseFee = decADULT_FEE
                ElseIf radChild.Checked = True Then
                    decBaseFee = decCHILD_FEE
                ElseIf radStudent.Checked = True Then
                    decBaseFee = decSTUDENT_FEE
                ElseIf radSenior.Checked = True Then
                    decBaseFee = decSENIOR_FEE
                End If

                If chkYoga.Checked = True Then
                    decBaseFee += decYOGA_FEE
                End If

                If chkKarate.Checked = True Then
                    decBaseFee += decKARATE_FEE
                End If

                If chkTrainer.Checked = True Then
                    decBaseFee += decTRAINER_FEE
                End If

                decTotalFee = decBaseFee * intMonths

                lblMonthlyRate.Text = decBaseFee.ToString("c")
                lblTotal.Text = decBaseFee.ToString("c")

            Else
                MessageBox.Show("Months bust be in the range 1-24.")
            End If
        Else
            MessageBox.Show("Months must be an integer.")
        End If
    End Sub

    Private Sub btnClr_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnClr.Click
        radAdult.Checked = True
        chkYoga.Checked = False
        chkKarate.Checked = False
        chkTrainer.Checked = False
        txtMoNo.Clear()
        lblMonthlyRate.Text = String.Empty
        lblTotal.Text = String.Empty
        txtMoNo.Focus()
    End Sub

    Private Sub btnExit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnExit.Click
        Me.Close()
    End Sub
End Class
