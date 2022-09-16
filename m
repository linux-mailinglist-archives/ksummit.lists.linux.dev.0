Return-Path: <ksummit+bounces-774-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D16B5BA8AF
	for <lists@lfdr.de>; Fri, 16 Sep 2022 10:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBB03280C8A
	for <lists@lfdr.de>; Fri, 16 Sep 2022 08:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092972F5E;
	Fri, 16 Sep 2022 08:54:07 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE5829A5
	for <ksummit@lists.linux.dev>; Fri, 16 Sep 2022 08:54:05 +0000 (UTC)
Received: from [89.101.193.66] (helo=[10.119.25.191]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oZ76o-00041M-4z; Fri, 16 Sep 2022 10:54:02 +0200
Message-ID: <8d200ca5-7ccd-fbf5-182a-602f00e98eca@leemhuis.info>
Date: Fri, 16 Sep 2022 09:54:01 +0100
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <linux@leemhuis.info>
To: ksummit@lists.linux.dev
References: <db597a89-1487-6a05-e2b4-24fc27bdebdd@leemhuis.info>
Subject: Re: [MAINTAINERS SUMMIT] Regression tracking & fixing: current state,
 problems, and next steps
In-Reply-To: <db597a89-1487-6a05-e2b4-24fc27bdebdd@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1663318445;7d2670a3;
X-HE-SMSGID: 1oZ76o-00041M-4z

On 20.06.22 14:33, Thorsten Leemhuis wrote:
> 
> This session is meant to complement the kernel summit session with the
> same title I just submitted separately
> (https://lore.kernel.org/ksummit/0ea86ba8-97a4-0b25-406d-ea261c82292a@leemhuis.info/
> ). The idea is to summarize in this session what has been discussed and
> agreed on in that ksummit session and further discuss issues that need
> further discussion.

If anyone is interested in the slides I showed yesterday, find them here
(note, I skipped a few because some things had come up earlier already):
http://www.leemhuis.info/files/talks/202209-kernel_maintainers_summit-regtracking.pdf

The slides for the kernel summit session I held on Wednesday can be
found here (the first section is similar, but more detailed):
https://lpc.events/event/16/contributions/1222/attachments/1105/2123/Leemhuis-regtracking.pdf

While at it, here also the links to regzbot's documentation:
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md

And for completeness, here is the link to the rendered version of
Documentation/process/handling-regressions.rst:
https://docs.kernel.org/process/handling-regressions.html

Ciao, Thorsten

