<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<center>
		<h3>Internal Organisation Home</h3>
		<form method="POST" action="/partnerintegrity/createintorg">
			<table>
			
				<tr>
					<td align="right">Create Internal Organisation: </td> 
					<td><button type="submit" name ="createorg" >Create</button></td>
				</tr>
				
				<tr>
					<td align="right">Search Organisation: </td> 
					<td><button type="submit" name = "searchorg" >Search</button></td>
				</tr>
				
				<%-- <tr>
					<td align="right">Organisation Name:</td>
					<td><input type="text" name="organisationName"
						value="${orgname}" /></td>
				</tr>
				<tr>
					<td align="right">Organisation Name:</td>
					<td><input type="text" name="organisationName"
						value="${orgname}" /></td>
				</tr>
				<tr>
					<td align="right">Trading Name:</td>
					<td><input type="text" name="tradingName"
						value="${tradingname}" /></td>
				</tr>
				<tr>
					<td align="right">Legal Name :</td>
					<td><input type="text" name="legalName" value="${legalname}" /></td>
				</tr>
				<tr>
					<td align="right">Local Name :</td>
					<td><input type="text" name="localName" value="${localname}" /></td>
				</tr>
				<tr>
					<td align="right">Organisation Type :</td>
					<td><input type="text" name="orgtype" value="${orgtype}" /></td>
					<td></td>
				</tr>
				<tr>
					<td align="right">Company Code</td>
					<td><input type="text" name="compcode" value="${compcode}" /></td>
				</tr>
				<tr>
					<td align="right">Organisation Source :</td>
					<td><select name="orgsrcid">
							<option value="selected">Choose Org Source</option>
							<c:forEach var="each" items="${orgSrcList}">
								<option value="${each.orgsrcId}">${each.name}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td align="right">Primary Business</td>
					<td><input type="text" name="pribiz" value="${pribiz}" /></td>
				</tr>
				<tr>
					<td align="right">Currency :</td>
					<td><select name="curid">
							<option value="selected">Choose Currency</option>
							<c:forEach var="each" items="${currencyList}">
								<option value="${each.curCode}">${each.name}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td align="right">Organization Size:</td>
					<td><input type="text" name="orgSize" value="${orgsize}" /></td>
				</tr>
				<tr>
					<td align="right">Organization Division:</td>
					<td><input type="text" name="organisationDiv"
						value="${division}" /></td>
				</tr>
				<tr>
					<td align="right">Organisation Business Unit:</td>
					<td><input type="text" name="orgBizUnit" value="${bizunit}" /></td>
				</tr>
				<tr>
					<td align="right">organizationDepartments:</td>
					<td><input type="text" name="orgDept" value="${depts}" /></td>
				</tr>
				<tr>
					<td align="right">Organization Address (linked):</td>
					<td><textarea name="organizationAddresst" value="" readonly></textarea></td>
				</tr>
				<tr>
					<td align="right">Organization Phone number:</td>
					<td><input type="text" value="" name="organizationPhonenumber" /></td>
				</tr>
				<tr>
					<td align="right">Organization Email:</td>
					<td><input type="text" value="" name="organizationEmail" /></td>
				</tr>

				<tr>
					<td align="right">Status:</td>
					<td>Active <input type="radio" name="status" checked />
						In-active<input type="radio" name="status" readonly /></td>
				</tr>
				<tr>
					<td align="right">Organization URL:</td>
					<td><input type="text" value="" name="organizationURL" /></td>
				</tr>
				<tr>
					<td align="right">Linked Organization(s):</td>
					<td><select name=linkedOrg multiple>
							<c:forEach var="each" items="${orgNameList}">
								<option value="${each.organisationId}">${each.name}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td align="right">Linked Org Type :</td>
					<td><select name="linkedOrgType" multiple>
							<c:forEach var="each" items="${relTypeList}">
								<option value="${each.relTypeId}">${each.relationshipType}</option>
							</c:forEach>
					</select> </select></td>
				</tr>
				<tr>
					<td><a href="*.jsp"> Delete</a></td>
					<td><input name="Update" type="submit" value="Save" /></td>
				</tr> --%>
			</table>
		</form>
	</center>

</body>
</html>