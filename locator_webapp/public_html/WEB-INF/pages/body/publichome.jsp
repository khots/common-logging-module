<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-template" prefix="template"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested"%>

	
		
	


<tr>
	<td width="100%" valign="top"><!-- target of anchor to skip menus --><a
		name="content" />

	<table summary="" cellpadding="0" cellspacing="0" border="0"
		width="600" height="100%">

		<!-- banner begins -->
		<tr>
			<td class="bannerHome"><img src="images/bannerHome.gif" height="140"></td>
		</tr>
		<!-- banner begins -->

		<tr>
			<td height="100%"><!-- target of anchor to skip menus --><a
				name="content" />
			<table summary="" cellpadding="0" cellspacing="0" border="0"
				height="100%">
				<tr>
					<td><!-- welcome begins -->
					<table summary="" cellpadding="0" cellspacing="0" border="0"
						width="390" height="100%">
						<tr>
							<td class="welcomeTitle" height="20"><bean:message key="label.home_welcome_message_header" /></td>
						</tr>
						<tr>
							<td class="welcomeContent" valign="top"><bean:message key="label.home_welcome_message" /></td>
						</tr>
					</table>
					<!-- welcome ends --></td>
					<td valign="top"><!-- sidebar begins -->
					<table summary="" cellpadding="0" cellspacing="0" border="0"
						height="100%">

						<!-- login begins -->
						<tr>
							<td valign="top">
							<table summary="" cellpadding="2" cellspacing="0" border="0"
								width="100%" class="sidebarSection">
								<tr>
									<td class="sidebarTitle" height="20"><bean:message key="label.login_header" /></td>
								</tr>
								<tr>
									<td class="sidebarLogin">

									<table cellpadding="2" cellspacing="0" border="0">
										<html:form  styleId="LoginForm" action="/Login">
										
										<tr>
											<td colspan="2">
										 		<html:errors/>
										 	</td>
									 	</tr>
										<tr>
											<td class="sidebarLogin" align="right"><label for="loginID"><bean:message key="label.login_id" /></label></td>
											<td class="formFieldLogin"><input class="formField" type="text" name="loginID" size="14" /></td>
										</tr>
										<tr>
											<td class="sidebarLogin" align="right"><label for="password"><bean:message key="label.login_password" /></label></td>
											<td class="formFieldLogin"><input class="password" type="password" name="password" size="14" /></td>
										</tr>
										<tr>
											<td class="sidebarLogin" align="right"><label for="application"><bean:message key="label.login_application" /></label></td>
											<td class="formFieldLogin"><input class="formField" type="text" name="application" size="14" /></td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><input class="actionButton" type="submit" value="Login" /></td>
										</tr>
										</html:form>
									</table>
									
									</td>
								</tr>
							</table>
							</td>
						</tr>
						<!-- login ends -->

						<!-- what's new begins -->
						<tr>
							<td valign="top">
							<table summary="" cellpadding="0" cellspacing="0" border="0"
								width="100%" class="sidebarSection">
								<tr>
									<td class="sidebarTitle" height="20">WHAT'S NEW</td>
								</tr>
								<tr>
									<td class="sidebarContent">What's new message. What's new
									message. What's new message. What's new message. What's new
									message.</td>
								</tr>
							</table>
							</td>
						</tr>
						<!-- what's new ends -->

						<!-- did you know? begins -->
						<tr>
							<td valign="top">
							<table summary="" cellpadding="0" cellspacing="0" border="0"
								width="100%" height="100%" class="sidebarSection">
								<tr>
									<td class="sidebarTitle" height="20">DID YOU KNOW?</td>
								</tr>
								<tr>
									<td class="sidebarContent" valign="top">Did you know message.
									Did you know message. Did you know message. Did you know
									message.</td>
								</tr>
							</table>
							</td>
						</tr>
						<!-- did you know? ends -->

						<!-- spacer cell begins (keep for dynamic expanding) -->
						<tr>
							<td valign="top" height="100%">
							<table summary="" cellpadding="0" cellspacing="0" border="0"
								width="100%" height="100%" class="sidebarSection">
								<tr>
									<td class="sidebarContent" valign="top">&nbsp;</td>
								</tr>
							</table>
							</td>
						</tr>
						<!-- spacer cell ends -->

					</table>
					<!-- sidebar ends --></td>
				</tr>
			</table></td>
		</tr>
	</table></td>
</tr>