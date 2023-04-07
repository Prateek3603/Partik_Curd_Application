<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="Partik_Curd_Application.Employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Name:</td>
                    <td><asp:TextBox ID="txtEmp_Name" runat="server"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td>Email Address:</td>
                    <td><asp:TextBox ID="txtEmail_Address" runat="server"></asp:TextBox></td>
                </tr>
                 <tr>
                       <td>Emp_Gender:</td>
                    <td>
                        <asp:RadioButtonList ID="rblEmp_Gender" runat="server" RepeatDirection="Horizontal">
                          <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                          <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                             <asp:ListItem Text="Other" Value="3"></asp:ListItem>
                        </asp:RadioButtonList>
                   </td>
               </tr>
                 <tr>
                    <td>Contact_Number:</td>
                    <td><asp:TextBox ID="txtContact_Number" runat="server"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td>Address:</td>
                   <%-- <td><asp:TextBox ID="txtAddress" runat="server"></asp:TextBox></td>--%>
                     <td><asp:TextBox id="txtAddress" TextMode="multiline" Columns="50" Rows="5" runat="server" /></td>
                </tr>
                 <tr>
                    <td>Experience:</td>
                    <td><asp:TextBox ID="txtExperience" runat="server"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td>Department:</td>
                    <td><asp:TextBox ID="txtDepartment" runat="server"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td>Education:</td>
                    <td><asp:TextBox ID="txtEducation" runat="server"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td>Hobby:</td>
                    <td><asp:TextBox ID="txtHobby" runat="server"></asp:TextBox></td>
                </tr>
                 <tr>
                    <td></td>
                    <td><asp:Button ID="btninsert" runat="server" Text="Submit" OnClick="btninsert_Click" /></td>
                </tr>

                <asp:GridView ID="grdEmployee" runat="server" AutoGenerateColumns="false" OnRowCommand="grdEmployee_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Emp_id">
                            <ItemTemplate >
                                <%#Eval("Emp_id") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Emp_Name">
                            <ItemTemplate >
                                <%#Eval("Emp_Name") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Email_Address">
                            <ItemTemplate >
                                <%#Eval("Email_Address") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Emp_Gender">
                            <ItemTemplate >
                               <%-- <%#Eval("Emp_Gender") %>--%>
                               <%--  <asp:Label ID="rblEmp_Gender" runat="server" Text='<%#Eval("Emp_Gender").Equals(1) ? "Male" : "Female" %>'></asp:Label>--%>
                                 <%#Eval("Emp_Gender").ToString() == "1" ? "Male" : Eval("Emp_Gender").ToString() == "2" ? "Female" : "Other"%>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Contact_Number">
                            <ItemTemplate >
                                <%#Eval("Contact_Number") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Address">
                            <ItemTemplate >
                                <%#Eval("Address") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Experience">
                            <ItemTemplate >
                                <%#Eval("Experience") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Department">
                            <ItemTemplate >
                                <%#Eval("Department") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Education">
                            <ItemTemplate >
                                <%#Eval("Education") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Hobby">
                            <ItemTemplate >
                                <%#Eval("Hobby") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Edit" >
                            <ItemTemplate >
                               <asp:LinkButton ID="lnkEdit" runat="server" CommandName="EditData" Text="Edit" CommandArgument='<%#Eval("Emp_id") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Delete" >
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="DeleteData" Text="Delete" CommandArgument='<%#Eval("Emp_id")%>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </table>
        </div>
    </form>
</body>
</html>
