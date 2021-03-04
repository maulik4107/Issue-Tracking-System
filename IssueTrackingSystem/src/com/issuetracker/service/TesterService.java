package com.issuetracker.service;

import java.util.List;

import com.issuetracker.bean.ModuleDetails;

public interface TesterService {

	public List<ModuleDetails> fetchModuleDetails(int testerId);

}
