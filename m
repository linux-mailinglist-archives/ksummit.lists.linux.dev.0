Return-Path: <ksummit+bounces-954-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2367766F2
	for <lists@lfdr.de>; Wed,  9 Aug 2023 20:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EBD51C212BB
	for <lists@lfdr.de>; Wed,  9 Aug 2023 18:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B031D312;
	Wed,  9 Aug 2023 18:04:54 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B5A1D2EF
	for <ksummit@lists.linux.dev>; Wed,  9 Aug 2023 18:04:51 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d6349472de6so23849276.0
        for <ksummit@lists.linux.dev>; Wed, 09 Aug 2023 11:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691604290; x=1692209090;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gFMVIlzzW0XoWS+ylAuNK31GDbJDnzbMiH4klCT/WC4=;
        b=HQAuHPvICoO0vWRNDp2kWBS9sayxaQN7Zt2ZUIiLp4jv2bS1LzK1FL45dEr2oQ0cJ3
         rIwp9qRKE2fCptuKEkNPJ1h3UzScQDMZifPyV7o9HJmIBQtBnZHCzOySxgsb7cSJUexu
         zANPFuwUHlS/PIW2iFXZ3eeB0WOBANhCkJoHWY9N+UcFGSTt1mmGRSQEteqns8pansB7
         /iedmZ3j6cBerCt63i1VSukT0JiwjqufVdJ5YicYdPZuoQZfdR8K80B3xP3UGj3BAViT
         3udWjfdNPNmckeqamwWVLMoTmqi2bnmNN/BQKmHHF3dqrSbX+8w7inSCZZC8wphFeXzC
         jcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691604290; x=1692209090;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gFMVIlzzW0XoWS+ylAuNK31GDbJDnzbMiH4klCT/WC4=;
        b=cQJiLwp9qpJ/xwozB1mTRMPR8ggoOLPF2CbEiD0fn85THBk0HOPM+cQbuoMcIkgdAC
         Mh6W8L8TGXAYuA2NyERmPkCejDYgiyCDTXbMMimGaIboKmVVzxW0j02/NmwmUpNeQ66A
         zgZ+saMNUuxiDzp0OIj9ui7fZAkrCaU4p2F5pg3WQn7TbhHtCqFKttOViaMx21K3epc0
         LuOKMZEUABaE+HoWbVyxKJkVQU7u5u81wSFgMQJ5bh/Dkpluih7sZJnIQTqUFlUl+R8/
         iKPHmH6zEjXWDFoWJzjJf+QN02ECKbbVuG8ucw7IINVCj3tl4Qsk+HQDO+pc/SJM+N0v
         RlOw==
X-Gm-Message-State: AOJu0YxdCK5dwM9WQpc0lLCtlzCWGPIcrBL9V0TVCJbHC1MZVwC19u7/
	liZP2z/TWJhTOK/ISEkafV8P0TIXareM0SQ76G26g0IciFlFZwV6Sdo=
X-Google-Smtp-Source: AGHT+IERkE/du5dzu1lwq+vtjz3ZInaFpVm9BkJsTNXXUFarJhoc6DseuuSyoQFTJHIf5jCnKx1LLf4XdIkPGZwcprs=
X-Received: by 2002:a25:513:0:b0:d22:ab7b:94f4 with SMTP id
 19-20020a250513000000b00d22ab7b94f4mr215062ybf.5.1691604290521; Wed, 09 Aug
 2023 11:04:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 9 Aug 2023 20:04:39 +0200
Message-ID: <CACMJSev18ZdTVDK7j3gCpzw4rAiaNMZRT4KSvLzd99H61XwMOA@mail.gmail.com>
Subject: [TECH TOPIC] Improving resource ownership and life-time in linux
 device drivers
To: ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi!

I submitted this proposal on time using the website but forgot about
sending it here too. Hope that's alright. The abstract follows.

Bartosz Golaszewski

--

Recently there have been several talks about issues with object
ownership in device drivers, use-after-free bugs and problems with
handling hot unplug events in certain subsystems.

First Laurent Pinchart revisited an older discussion about the harmful
side-effects of devres helpers during LPC 2022[1]. I then went down
that rabbit hole only to discover a whole suite of issues, not really
linked to devres in any way but rather mostly caused by the way
subsystems and drivers mix reference counted resources with regular
ones[2]. This year Wolfram Sang continued the research and presented
even more vulnerable subsystems as well as some potential remedies
during his talk at the EOSS 2023 in Prague[3].

I have since experimented with several approaches and would like to
present some updates on this subject. During this talk I plan to jump
straight into presenting concrete ideas and timelines for improving
the driver model and introducing some unification in the way
subsystems handle driver data. While this is a significant effort
spanning multiple device subsystems that will need to be carried out
in many phases over what will most likely be years, without addressing
the problems, we'll be left with many parts of the kernel not being
able to correctly handle simple driver unbinds.

[1] https://lpc.events/event/16/contributions/1227/
[2] https://fosdem.org/2023/schedule/event/devm_kzalloc/
[3] https://eoss2023.sched.com/event/1LcPP/subsystems-with-object-lifetime-issues-in-the-embedded-case-wolfram-sang-sang-engineering-renesas

