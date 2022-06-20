Return-Path: <ksummit+bounces-673-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [139.178.84.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8F2551AC4
	for <lists@lfdr.de>; Mon, 20 Jun 2022 15:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 019642E0A0F
	for <lists@lfdr.de>; Mon, 20 Jun 2022 13:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47FB256D;
	Mon, 20 Jun 2022 13:33:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF4D2562
	for <ksummit@lists.linux.dev>; Mon, 20 Jun 2022 13:33:13 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1o3HWg-0001hf-TA; Mon, 20 Jun 2022 15:33:11 +0200
Message-ID: <db597a89-1487-6a05-e2b4-24fc27bdebdd@leemhuis.info>
Date: Mon, 20 Jun 2022 15:33:08 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Thorsten Leemhuis <linux@leemhuis.info>
To: ksummit@lists.linux.dev
Content-Language: en-US
Subject: [MAINTAINERS SUMMIT] Regression tracking & fixing: current state,
 problems, and next steps
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1655731993;67ab8dc3;
X-HE-SMSGID: 1o3HWg-0001hf-TA

[sending a copy to this list, now that the old ksummit-discuss list is
DEFUNCT, where I posted the msg already a few days ago:
https://lists.linuxfoundation.org/pipermail/ksummit-discuss/2022-June/007340.html
]

This session is meant to complement the kernel summit session with the
same title I just submitted separately
(https://lore.kernel.org/ksummit/0ea86ba8-97a4-0b25-406d-ea261c82292a@leemhuis.info/
). The idea is to summarize in this session what has been discussed and
agreed on in that ksummit session and further discuss issues that need
further discussion.

I used a similar model in 2017 and it seems it worked well for everyone.
What exactly will be discussed in this sessions depends on how the
kernel summit session evolves, but I expect the following topics might
need further discussion among the core maintainers (for details on any
of these points please see the kernel summit submission linked above):

 * How slow quite a few mainline regressions are resolved, as even
simple regression fixes sometimes linger in -next for weeks before being
mainlined.

 * Do we care that some regressions (and many bugs) reported in
bugzilla.kernel.org are never forwarded to the maintainers? And if so,
what do we want to do about it? I tried to keep an eye on things, but
that's sometimes quite time-consuming.

 * Should I track all or some regression with regzbot that were reported
by CI systems?

 * open question: Am I holding this regression tracking thingy right or
do you want me to do it differently somehow? Or is there anything else I
can do to make my regression tracking efforts more useful for maintainers?

Ciao, Thorsten

