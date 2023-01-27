import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tribation_task/utils/print.dart';

import '../../models/post_model.dart';
import '../../models/user_model.dart';
import '../../service/model/model_service.dart';
import '../../src/widgets/core/my_base_list_view.dart';
import '../../view_models/flow/flow_view_model.dart';
import '../home/components/post_widget/post_widget.dart';

class FlowView extends StatelessWidget {
  const FlowView({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = Get.find<FlowViewModel>();
    bas("viewModel");
    bas(viewModel);
    return SingleChildScrollView(child: Obx(
      () {
        bas("viewModel.listPost.length");
        bas(viewModel.listPost.length);
        return MyBaseListView<PostModel>(
          emptyTitle: "",
          
            isSeparator: true,
            seperator: const SizedBox(height: 15),
            builder: (model, index) {
              return FutureBuilder<UserModel?>(
                  future: ModelService().getUser(model.userId),
                  builder: (context, snap) {
                    if (!snap.hasData || snap.data == null) {
                      return const SizedBox.shrink();
                    }
                    return PostCardWidget(
                      postModel: model,
                      userModel: snap.data!,
                    );
                  });
            },
            list: viewModel.listPost);
      },
    ));
  }
}
