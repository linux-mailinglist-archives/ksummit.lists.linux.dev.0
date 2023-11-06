Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0051E7E2BED
	for <lists@lfdr.de>; Mon,  6 Nov 2023 19:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 734B0B21193
	for <lists@lfdr.de>; Mon,  6 Nov 2023 18:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41402D036;
	Mon,  6 Nov 2023 18:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9C62D029;
	Mon,  6 Nov 2023 18:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Received: from in02.mta.xmission.com ([166.70.13.52]:48332)
	by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1r03pw-0033TT-8r; Mon, 06 Nov 2023 10:56:32 -0700
Received: from ip68-227-168-167.om.om.cox.net ([68.227.168.167]:39950 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1r03pv-00ById-7J; Mon, 06 Nov 2023 10:56:31 -0700
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Eric Wong <e@80x24.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
  users@linux.kernel.org,  ksummit@lists.linux.dev
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
	<87r0l2yi7v.fsf@email.froward.int.ebiederm.org>
	<20231106172113.M499728@dcvr>
Date: Mon, 06 Nov 2023 11:56:23 -0600
In-Reply-To: <20231106172113.M499728@dcvr> (Eric Wong's message of "Mon, 6 Nov
	2023 17:21:13 +0000")
Message-ID: <87il6eyddk.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1r03pv-00ById-7J;;;mid=<87il6eyddk.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=68.227.168.167;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX1/Sbfx/fcy8Fq0lEjPb1njtatad62tP/SI=
X-SA-Exim-Connect-IP: 68.227.168.167
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.4887]
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa07 1397; Body=1 Fuz1=1 Fuz2=1]
	* -0.0 T_SCC_BODY_TEXT_LINE No description available.
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Eric Wong <e@80x24.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 521 ms - load_scoreonly_sql: 0.04 (0.0%),
	signal_user_changed: 11 (2.1%), b_tie_ro: 9 (1.8%), parse: 1.01 (0.2%),
	 extract_message_metadata: 18 (3.4%), get_uri_detail_list: 1.41 (0.3%),
	 tests_pri_-2000: 13 (2.5%), tests_pri_-1000: 2.3 (0.4%),
	tests_pri_-950: 1.18 (0.2%), tests_pri_-900: 0.97 (0.2%),
	tests_pri_-200: 0.87 (0.2%), tests_pri_-100: 6 (1.1%), tests_pri_-90:
	202 (38.7%), check_bayes: 193 (37.0%), b_tokenize: 4.7 (0.9%),
	b_tok_get_all: 5 (1.0%), b_comp_prob: 1.65 (0.3%), b_tok_touch_all:
	178 (34.1%), b_finish: 0.83 (0.2%), tests_pri_0: 123 (23.7%),
	check_dkim_signature: 0.46 (0.1%), check_dkim_adsp: 3.8 (0.7%),
	poll_dns_idle: 126 (24.1%), tests_pri_10: 2.0 (0.4%), tests_pri_500:
	137 (26.3%), rewrite_mail: 0.00 (0.0%)
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)

Eric Wong <e@80x24.org> writes:

> "Eric W. Biederman" <ebiederm@xmission.com> wrote:
>> Has anyone come up with a good way to mirror the public inbox git
>> repositories?
>> 
>> In the rare occasion when public inbox splits git repositories any
>> script that just mirrors the git repository silent stops working.
>
> public-inbox-clone + public-inbox-fetch in released versions
> of public-inbox work for mirroring individual inboxes.
>
>
> public-inbox-clone for 2.0 (WIP in https://80x24.org/public-inbox.git )
> can mirror multiple inboxes at once using grokmirror manifests
> (no need for -fetch).

Thanks I will take a look.

Eric


