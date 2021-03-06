<?php /* $Id: CareerPortalTemplateEdit.tpl 3626 2007-11-16 00:49:03Z andrew $ */ ?>
<?php TemplateUtility::printHeader(__('Settings'), array('modules/settings/validator.js', 'modules/settings/Settings.js', 'js/careerportal.js')); ?>
<?php TemplateUtility::printHeaderBlock(); ?>
<?php TemplateUtility::printTabs($this->active, $this->subActive); ?>
    <div id="main">
        <?php TemplateUtility::printQuickSearch(); ?>

        <div id="contents">
            <table>
                <tr>
                    <td width="3%">
                        <img src="images/settings.gif" width="24" height="24" border="0" alt="Settings" style="margin-top: 3px;" />&nbsp;
                    </td>
                    <td><h2><?php echo __("Settings");?>: <?php echo __("Administration");?></h2></td>
                </tr>
            </table>

            <script type="text/javascript">
                function insertAtCursor(myField, myValue)
                {
                    myValue = myValue.split("\\n").join("\n");
                    if (document.selection)
                    {
                        myField.focus();
                        sel = document.selection.createRange();
                        sel.text = myValue;
                    }
                    else if (myField.selectionStart || myField.selectionStart == 0)
                    {
                        var startPos = myField.selectionStart;
                        var endPos = myField.selectionEnd;
                        myField.value = myField.value.substring(0, startPos)
                            + myValue
                            + myField.value.substring(endPos, myField.value.length);
                    }
                    else
                    {
                        myField.value += myValue;
                    }
                }
            </script>

            <p class="note"><?php echo __("Edit Template");?>: <?php $this->_($this->templateName); ?></p>
            <?php echo __("Top, Left, and Footer is HTML code used in the body of every page, and CSS is the CSS code included in every page.");?><br /><br />
            <?php echo __("Some fields have special keywords which are used to position some kind of content.");?> 
            <?php echo __("For example, the Left area has links to other pages in the template, and the 'body: search results' area can include a keyword which gets replaced with a table of search results or job openings.");?>
            <?php echo __("A button is included on these areas to insert the associated keywords.");?><br />

            <form name="careerPortalSettingsForm" id="careerPortalSettingsForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=settings&amp;a=careerPortalTemplateEdit" method="post">
                <input type="hidden" name="postback" value="postback" />
                <input type="hidden" name="templateName" value="<?php $this->_($this->templateName); ?>" />
                <input type="hidden" name="continueEdit" id="continueEdit" value="0" />
                <p>
                    <input type="submit" class="button" value="<?php echo __("Save");?>">
                    <input type="submit" class="button" value="<?php echo __("Save and Continue Editing");?>" onclick="document.getElementById('continueEdit').value='1';">
                </p>

                <?php $index = 0; ?>
                <?php foreach ($this->template as $setting => $value): ?>
                    <p class="note">
                        <a href="javascript:void(0);" id="expand<?php echo($index); ?>" onclick="document.getElementById('expand<?php echo($index); ?>').style.display='none';document.getElementById('shrink<?php echo($index); ?>').style.display='';document.getElementById('editarea<?php echo($index); ?>').style.display=''; document.getElementById('editareacommand<?php echo($index); ?>').style.display='';">
                            <img src="images/next.gif" border=0>
                        </a>
                        <a href="javascript:void(0);" id="shrink<?php echo($index); ?>" onclick="document.getElementById('expand<?php echo($index); ?>').style.display='';document.getElementById('shrink<?php echo($index); ?>').style.display='none';document.getElementById('editarea<?php echo($index); ?>').style.display='none'; document.getElementById('editareacommand<?php echo($index); ?>').style.display='none';" style="display:none;">
                            <img src="images/downward.gif" border=0>
                        </a>
                        <?php $this->_($setting); ?>
                        <?php if($setting == 'Body - Search Results'): ?>
                            / Job Listings
                        <?php endif; ?>
                    </p>
                    <p id="editareacommand<?php echo($index); ?>" style="display:none;">
                        <?php if($setting != 'CSS'): ?>
                            <input type="button" class="button" value="<?php echo __("Insert Site Name");?>" onclick="insertAtCursor(document.getElementById('edittext<?php echo($index); ?>'), &quot;<siteName>&quot;);">
                            &nbsp;&nbsp;&nbsp;
                        <?php endif; ?>
                        <?php if($setting == 'Header'): ?>
                            <input type="button" class="button" value="<?php echo __("Insert Menu Options");?>" onclick="insertAtCursor(document.getElementById('edittext<?php echo($index); ?>'), &quot;<a-LinkMain>Main Page</a><br />\n<a-ListAll>List All Jobs</a><br />&quot;);">
                            &nbsp;&nbsp;&nbsp;
                        <?php endif; ?>
                        <?php if($setting == 'Content - Main'): ?>
                            <input type="button" class="button" value="<?php echo __("Insert number of Open Positions");?>" onclick="insertAtCursor(document.getElementById('edittext<?php echo($index); ?>'), &quot;<numberOfOpenPositions>&quot;);">
                            &nbsp;&nbsp;&nbsp;
                        <?php endif; ?>
                        <?php if($setting == 'Content - Apply for Position'): ?>
                            <input type="button" class="button" value="<?php echo __("Insert Job Title");?>" onclick="insertAtCursor(document.getElementById('edittext<?php echo($index); ?>'), &quot;<title>&quot;);">
                            &nbsp;&nbsp;&nbsp;
                            <select id="jobapplyselect<?php echo($index); ?>">
                                <option value="<input-firstName>"><?php echo __("First Name");?> *</option>
                                <option value="<input-lastName>"><?php echo __("Last Name");?> *</option>
                                <option value="<input-address>"><?php echo __("Address Line");?></option>
                                <option value="<input-city>"><?php echo __("City");?></option>
                                <option value="<input-state>"><?php echo __("State");?></option>
                                <option value="<input-zip>"><?php echo __("Zip Code");?></option>
                                <option value="<input-phone>"><?php echo __("Phone Number (Work)");?></option>
                                <option value="<input-phone-home>"><?php echo __("Phone Number (Home)");?></option>
                                <option value="<input-email>"><?php echo __("E-Mail Address");?> *</option>
                                <option value="<input-email2>"><?php echo __("E-Mail Address 2");?></option>
                                <option value="<input-source>"><?php echo __("Source");?></option>
                                <option value="<input-employer>"><?php echo __("Current Employer");?></option>
                                <option value="<input-emailconfirm>"><?php echo __("Retype E-Mail Address (optional)");?></option>
                                <option value="<input-resumeUpload>"><?php echo __("Resume Upload");?></option>
                                <option value="<input-keySkills>"><?php echo __("Key Skills");?></option>
                                <option value="<input-extraNotes>"><?php echo __("Extra Notes");?></option>
                                <?php if ($this->eeoEnabled == 1): ?>
                                    <?php if ($this->EEOSettingsRS['genderTracking'] == 1): ?>
                                        <option value="<input-eeo-gender>"><?php echo __("EEO: Gender");?></option>
                                    <?php endif; ?>
                                    <?php if ($this->EEOSettingsRS['ethnicTracking'] == 1): ?>
                                        <option value="<input-eeo-race>"><?php echo __("EEO: Ethnicity");?></option>
                                    <?php endif; ?>
                                    <?php if ($this->EEOSettingsRS['veteranTracking'] == 1): ?>
                                        <option value="<input-eeo-veteran>"><?php echo __("EEO: Veteran Status");?></option>
                                    <?php endif; ?>
                                    <?php if ($this->EEOSettingsRS['disabilityTracking'] == 1): ?>
                                        <option value="<input-eeo-disability>"><?php echo __("EEO: Disability Status");?></option>
                                    <?php endif; ?>
                                <?php endif; ?>
                                <?php foreach($this->extraFieldsForCandidates as $ef): ?>
                                    <option value="<input-extraField-<?php echo(urlencode($ef['fieldName'])); ?>>"><?php $this->_($ef['fieldName']); ?></option>
                                <?php endforeach; ?>
                                <option value="<submit value=&quot;<?php echo __("Apply for Position");?>&quot;>"><?php echo __("Submit Button");?></option>
                            </select>
                            <input type="button" class="button" value="<?php echo __("Insert job application field");?>" onclick="insertAtCursor(document.getElementById('edittext<?php echo($index); ?>'), document.getElementById('jobapplyselect<?php echo($index); ?>').value);">
                            &nbsp;&nbsp;&nbsp;
                        <?php endif; ?>
                        <?php if($setting == 'Content - Questionnaire'): ?>
                            <!-- Insert special buttons -->
                        <?php endif; ?>
                        <?php if($setting == 'Content - Thanks for your Submission'): ?>
                            <input type="button" class="button" value="<?php echo __("Insert back to job details link");?>" onclick="insertAtCursor(document.getElementById('edittext<?php echo($index); ?>'), &quot;<a-jobDetails><?php echo __("Job Details");?></a>&quot;);">
                            &nbsp;&nbsp;&nbsp;
                        <?php endif; ?>
                        <?php if($setting == 'CSS'): ?>
                            <select id="jobdetailcsssselect<?php echo($index); ?>">
                                <option value="body\n{\n}"><?php echo __("Page Body");?></option>
                                <option value=".inputBoxName\n{\n}"><?php echo __("First Name, Last Name input boxes");?></option>
                                <option value=".inputBoxArea\n{\n}"><?php echo __("Large input boxes (notes)");?></option>
                                <option value=".inputBoxFile\n{\n}"><?php echo __("File upload box");?></option>
                                <option value=".inputBoxNormal\n{\n}"><?php echo __("All other input boxes (E-Mail)");?></option>
                                <option value="table.sortable\n{\nborder-collapse: collapse;\nempty-cells: show;\n}\ntr.rowHeading\n{\n}\ntr.oddTableRow\n{\n}\ntr.evenTableRow\n{\n}\na.sortheader:hover,\na.sortheader:link,\na.sortheader:visited\n{\n}"><?php echo __("Search Results Table");?></option>
                            </select>
                            <input type="button" class="button" value="<?php echo __("Insert CSS class definition");?>" onclick="insertAtCursor(document.getElementById('edittext<?php echo($index); ?>'), document.getElementById('jobdetailcsssselect<?php echo($index); ?>').value);">
                            &nbsp;&nbsp;&nbsp;
                        <?php endif; ?>
                        <?php if($setting == 'Content - Job Details'): ?>
                            <input type="button" class="button" value="<?php echo __("Insert Apply to Job Link");?>" onclick="insertAtCursor(document.getElementById('edittext<?php echo($index); ?>'), &quot;<a-applyToJob>Apply to Job</a>&quot;);">
                            &nbsp;&nbsp;&nbsp;
                            <select id="jobdetailsselect<?php echo($index); ?>">
                                <option value="<title>"><?php echo __("Job Title");?></option>
                                <option value="<type>"><?php echo __("Type");?></option>
                                <option value="<city>"><?php echo __("City");?></option>
                                <option value="<state>"><?php echo __("State");?></option>
                                <option value="<openings>"><?php echo __("Openings");?></option>
                                <option value="<rate>"><?php echo __("Max Rate");?></option>
                                <option value="<salary>"><?php echo __("Salary");?></option>
                                <option value="<created>"><?php echo __("Date Created");?></option>
                                <option value="<daysOld>"><?php echo __("Days Old");?></option>
                                <option value="<recruiter>"><?php echo __("Recruiter");?></option>
                                <option value="<companyName>"><?php echo __("Company Name");?></option>
                                <option value="<contactName>"><?php echo __("Contact Name");?></option>
                                <option value="<contactPhone>"><?php echo __("Contact Phone");?></option>
                                <option value="<contactEmail>"><?php echo __("Contact E-Mail");?></option>
                                <option value="<description>"><?php echo __("Description");?></option>
                                <?php foreach($this->extraFieldsForJobOrders as $ef): ?>
                                    <option value="<extraField-<?php echo(urlencode($ef['fieldName'])); ?>>"><?php $this->_($ef['fieldName']); ?></option>
                                <?php endforeach; ?>
                            </select>
                            <input type="button" class="button" value="<?php echo __("Insert job details element");?>" onclick="insertAtCursor(document.getElementById('edittext<?php echo($index); ?>'), document.getElementById('jobdetailsselect<?php echo($index); ?>').value);">
                            &nbsp;&nbsp;&nbsp;
                        <?php endif; ?>
                        <?php if($setting == 'Content - Search Results'): ?>
                            <input type="button" class="button" value="<?php echo __("Insert Number of Search Results");?>" onclick="insertAtCursor(document.getElementById('edittext<?php echo($index); ?>'), &quot;<numberOfSearchResults>&quot;);">
                            &nbsp;&nbsp;&nbsp;
                            <input type="button" class="button" value="<?php echo __("Insert Search Results Table");?>" onclick="insertAtCursor(document.getElementById('edittext<?php echo($index); ?>'), &quot;<searchResultsTable>&quot;);">
                            &nbsp;&nbsp;&nbsp;
                        <?php endif; ?>
                    </p>
                    <div id="editarea<?php echo($index); ?>" style="display:none;">
                        <textarea name="<?php $this->_(md5($setting)); ?>" id="edittext<?php echo($index); ?>" style="width:920px; height:150px;"><?php $this->_($value); ?></textarea>
                        <br /><br />
                    </div>

                    <?php $index++; ?>
                <?php endforeach; ?>
                <br />
                <input type="submit" class="button" value="<?php echo __("Save");?>">
                <input type="submit" class="button" value="<?php echo __("Save and Continue Editing");?>" onmousedown="document.getElementById('continueEdit').value='1';">
            </form>
        </div>
    </div>
<?php TemplateUtility::printFooter(); ?>
