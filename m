Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 632447E2A37
	for <lists@lfdr.de>; Mon,  6 Nov 2023 17:46:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D1A2B20F38
	for <lists@lfdr.de>; Mon,  6 Nov 2023 16:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD6629421;
	Mon,  6 Nov 2023 16:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC4229400;
	Mon,  6 Nov 2023 16:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Received: from in01.mta.xmission.com ([166.70.13.51]:47408)
	by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1r02D8-00DI6f-Ui; Mon, 06 Nov 2023 09:12:22 -0700
Received: from ip68-227-168-167.om.om.cox.net ([68.227.168.167]:60372 helo=email.froward.int.ebiederm.org.xmission.com)
	by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1r02D7-00Eqa8-R5; Mon, 06 Nov 2023 09:12:22 -0700
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org,  ksummit@lists.linux.dev
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
Date: Mon, 06 Nov 2023 10:11:48 -0600
In-Reply-To: <20231106-venomous-raccoon-of-wealth-acc57c@nitro> (Konstantin
	Ryabitsev's message of "Mon, 6 Nov 2023 10:33:21 -0500")
Message-ID: <87r0l2yi7v.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1r02D7-00Eqa8-R5;;;mid=<87r0l2yi7v.fsf@email.froward.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=68.227.168.167;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX1//Jv9/PmPJjmCjzoz2vIEnS83EkZlry6Q=
X-SA-Exim-Connect-IP: 68.227.168.167
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Level: ***
X-Spam-Virus: No
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.5000]
	*  1.0 XM_B_Investor BODY: Commonly used business phishing phrases
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa01 1397; Body=1 Fuz1=1 Fuz2=1]
	* -0.0 T_SCC_BODY_TEXT_LINE No description available.
	*  0.5 XM_B_Unsub Unsubscribe in body of email but missing unsubscribe
	*       header
	*  1.5 TR_XM_BayesUnsub High bayes score with no unsubscribe header
X-Spam-DCC: XMission; sa01 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ***;Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 535 ms - load_scoreonly_sql: 0.03 (0.0%),
	signal_user_changed: 4.0 (0.8%), b_tie_ro: 2.8 (0.5%), parse: 0.65
	(0.1%), extract_message_metadata: 12 (2.2%), get_uri_detail_list: 1.40
	(0.3%), tests_pri_-2000: 13 (2.4%), tests_pri_-1000: 1.81 (0.3%),
	tests_pri_-950: 1.00 (0.2%), tests_pri_-900: 0.78 (0.1%),
	tests_pri_-90: 256 (47.9%), check_bayes: 254 (47.5%), b_tokenize: 5
	(1.0%), b_tok_get_all: 7 (1.3%), b_comp_prob: 1.83 (0.3%),
	b_tok_touch_all: 237 (44.3%), b_finish: 0.72 (0.1%), tests_pri_0: 235
	(44.0%), check_dkim_signature: 0.38 (0.1%), check_dkim_adsp: 2.9
	(0.5%), poll_dns_idle: 1.46 (0.3%), tests_pri_10: 1.74 (0.3%),
	tests_pri_500: 7 (1.2%), rewrite_mail: 0.00 (0.0%)
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> Hello, all:
>
> About 70% of all vger traffic is linux-kernel@vger.kernel.org ("LKML"), which
> is explained by the following 2 facts:
>
> 1. There are ~2900 subscribers to that list
> 2. It is added to all patches because it has "F: *" in MAINTAINERS
>
> In the past month alone that list received 33,000 posts, which translates to
> about 3.1 million messages delivered daily. This has pretty critical
> downsides:
>
> - due to the sheer volume of messages, LKML is generally seen as useless for
>   holding any actual discussions

I have never had that impression of LKML.

Of course I bring it into public-inbox locally on my end, as gmail's
capacity has always been too small.

I definitely periodically skim LKML and see what is there.

> - people tend to subscribe gmail accounts to it and then filter out what they
>   don't want
> - due to gmail's quota policies, this generally results in anywhere from 50K to
>   200K messages stuck in the queue all trying to deliver to gmail and being
>   deferred with "this account is receiving too much mail"
>
> For this reason, I propose switching the "F: *" entry in MAINTAINERS 
> ("THE REST") to patches@lists.linux.dev instead. This list differs from LKML
> in the following important aspects:
>
> - it allows unrestricted posting, but
> - all subscriptions must be pre-moderated, with the goal to only allow bot
>   accounts to receive patches sent to that list (e.g. currently only the 0-day
>   bot is subscribed)
> - it is made available via public-inbox/lei and anonymous POP3, so those who
>   want to still be able to have it delivered into their Gmail inbox will be
>   able to set it up via POP3 import functionality (docs forthcoming)

Has anyone come up with a good way to mirror the public inbox git
repositories?

In the rare occasion when public inbox splits git repositories any
script that just mirrors the git repository silent stops working.

For something with LKML volume that is going to be significant.

So I would really appreciate it if before we have to start using public
inbox to get the full stream of everything, that there be an easy to
find commonly available script that makes it easy to mirror an entire
public inbox mailbox.

Eric

