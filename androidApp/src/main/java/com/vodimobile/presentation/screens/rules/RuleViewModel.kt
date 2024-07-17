package com.vodimobile.presentation.screens.rules

import androidx.lifecycle.ViewModel
import androidx.navigation.NavHostController
import com.vodimobile.presentation.LeafScreen
import com.vodimobile.presentation.screens.rules.store.RulesIntent
import com.vodimobile.presentation.screens.rules.store.RulesOutput

class RuleViewModel(private val output: (RulesOutput) -> Unit) : ViewModel() {
    fun onIntent(intent: RulesIntent) {
        when (intent) {
            RulesIntent.BackClick -> {
                onOutput(RulesOutput.BackClick)
            }
            is RulesIntent.RuleClick -> {
                onOutput(RulesOutput.RuleClick(intent.ruleId))
            }
        }
    }

    private fun onOutput(o: RulesOutput) {
        output(o)
    }
}
