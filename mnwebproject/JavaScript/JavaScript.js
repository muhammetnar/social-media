function check()
{
    var emailtextbox = document.getElementById("textemail").value;
    if (emailtextbox.length <= 0)
    {
        document.getElementById("emailchecklabel").textContent = "Boş Geçilemez";
    }

}
document.getElementById("BtnSend").addEventListener("click", check, false);