import 'package:flutter/material.dart';
import 'dart:async';
import 'incident_detail_item.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poc_flutter_template/services/scc_incident_detail_provider.dart';

class IncidentDetailScreen extends HookConsumerWidget {
  const IncidentDetailScreen({super.key, required this.incidentId});

  final String incidentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final incidentDetail = ref.watch($incidentDetailProvider.select((value) => value.incident));
    final isLoading = ref.watch($incidentDetailProvider.select((value) => value.isLoading));
    final notifier = ref.watch($incidentDetailProvider.notifier);

    useEffect(() {
      Future(() {
        notifier.getIncidentsDetail(incidentId);
      });
      return null;
    }, []);
    
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Incident Details'),
        automaticallyImplyLeading: true,
      ),
    body: isLoading ? const Center(
              child: CircularProgressIndicator(),)  : Container(alignment: Alignment.topCenter, 
                    child: incidentDetail.id != null ? IncidentDetailItem(incident: incidentDetail) : const Text("NO INCIDENT INFORMATION"),),
    );
    
  }
}