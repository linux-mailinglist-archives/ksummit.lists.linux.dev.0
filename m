Return-Path: <ksummit+bounces-2290-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DD1B42362
	for <lists@lfdr.de>; Wed,  3 Sep 2025 16:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 812B53A720E
	for <lists@lfdr.de>; Wed,  3 Sep 2025 14:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432DC308F24;
	Wed,  3 Sep 2025 14:18:30 +0000 (UTC)
Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727742FC887
	for <ksummit@lists.linux.dev>; Wed,  3 Sep 2025 14:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756909110; cv=none; b=n1uOOtQWejHZPL4WCcBaqZ1Q9R2ijQNr+MFdENEHdtbXfrw1SgBfbOFGknvq8TDXsdUq0DnHvYMltmWGMPoEb4p2NQkF2RKMcNzso8D13c69zjg3sA7tUiU7IT9OumJgjgzB4CFbBfeZng2JQJ9//lJxcPkctDO5W/Yyzd69UJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756909110; c=relaxed/simple;
	bh=eoQxeBC5N0ILHmoJkoh+0vK4Ilhq4T+MfyLupDOSxAU=;
	h=From:To:Cc:References:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type:Subject; b=DyC5GBUmbNf7yekJdipaE4bUGourZfnTcqFYNIr+bhdHLiFyFLeYaMxhM7rbipaVPIx4x/nFR/TA9TZ4Z5+DCvcCjmV68rP1BA+i3brGZSdevo8I++peexpHYJB+9j9awLhsFnT+/Ez7gc1X+fd9kAdJcn/x6i/2orOy1upiGCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; arc=none smtp.client-ip=166.70.13.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Received: from in01.mta.xmission.com ([166.70.13.51]:42556)
	by out01.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1utnOn-0086eu-67; Wed, 03 Sep 2025 07:19:41 -0600
Received: from ip72-198-198-28.om.om.cox.net ([72.198.198.28]:37238 helo=email.froward.int.ebiederm.org.xmission.com)
	by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1utnOm-00FPUD-99; Wed, 03 Sep 2025 07:19:40 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,  Rob Herring
 <robherring2@gmail.com>,  Jiri Kosina <jikos@kernel.org>,
  ksummit@lists.linux.dev
References: <CACMJSes7ZnGo+Wyk_Db8VEUb8iXFB6-ev3hceY9aY1vjhpywTQ@mail.gmail.com>
	<CAHk-=wgOXd-meRuz5Gv2oz0W0wBUOpMO5CK9eifjfdR5Xz_-Fw@mail.gmail.com>
	<536or9s2-r219-2854-2n7s-q299s7q7noq9@xreary.bet>
	<CAHk-=wi2E0BBX1ZUEo5B5a0E+M_eFU_NgWgp+cABfsqR9f-cAQ@mail.gmail.com>
	<CACMJSesxLDH+ZPcbFq+s-4E+3QmhU4JejYZ6-SoYBfM0ePCCtQ@mail.gmail.com>
	<CAL_JsqKqO2Qg6VnRaotQdfrfoo78Y8AA1AKQBrD_XVSEK2BMgA@mail.gmail.com>
	<CAHk-=whkAe8f4=ttQmZhtoKvGtCLhEA-oHwUEvQFftYAwfVwCA@mail.gmail.com>
	<CACMJSevrym+yvkmNTXcavDG7Xi5wOrnYYunuMo4ZMP7ti-ve7Q@mail.gmail.com>
Date: Wed, 03 Sep 2025 08:19:22 -0500
In-Reply-To: <CACMJSevrym+yvkmNTXcavDG7Xi5wOrnYYunuMo4ZMP7ti-ve7Q@mail.gmail.com>
	(Bartosz Golaszewski's message of "Thu, 28 Aug 2025 17:11:09 +0200")
Message-ID: <87ecsn3c85.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1utnOm-00FPUD-99;;;mid=<87ecsn3c85.fsf@email.froward.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=72.198.198.28;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX18zDE9INeVj5QTUQxQExdLXji/qbLGXPY0=
X-Spam-Level: 
X-Spam-Virus: No
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.4654]
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa03 1397; Body=1 Fuz1=1 Fuz2=1]
	*  0.2 XM_B_SpammyWords One or more commonly used spammy words
X-Spam-DCC: XMission; sa03 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 448 ms - load_scoreonly_sql: 0.03 (0.0%),
	signal_user_changed: 3.5 (0.8%), b_tie_ro: 2.4 (0.5%), parse: 0.65
	(0.1%), extract_message_metadata: 10 (2.3%), get_uri_detail_list: 0.80
	(0.2%), tests_pri_-2000: 16 (3.7%), tests_pri_-1000: 1.84 (0.4%),
	tests_pri_-950: 1.05 (0.2%), tests_pri_-900: 0.78 (0.2%),
	tests_pri_-90: 76 (16.9%), check_bayes: 75 (16.6%), b_tokenize: 4.2
	(0.9%), b_tok_get_all: 6 (1.3%), b_comp_prob: 1.44 (0.3%),
	b_tok_touch_all: 60 (13.4%), b_finish: 0.70 (0.2%), tests_pri_0: 325
	(72.4%), check_dkim_signature: 0.37 (0.1%), check_dkim_adsp: 3.2
	(0.7%), poll_dns_idle: 1.02 (0.2%), tests_pri_10: 2.5 (0.6%),
	tests_pri_500: 8 (1.9%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [MAINTAINER SUMMIT] Enforcing API deprecation
X-SA-Exim-Connect-IP: 166.70.13.51
X-SA-Exim-Rcpt-To: ksummit@lists.linux.dev, jikos@kernel.org, robherring2@gmail.com, torvalds@linux-foundation.org, bartosz.golaszewski@linaro.org
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out01.mta.xmission.com); SAEximRunCond expanded to false

Bartosz Golaszewski <bartosz.golaszewski@linaro.org> writes:

> On Wed, 27 Aug 2025 at 18:58, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> All I'm saying is that people who do new API's should either just
>> accept that, or just convert between the two. None of this "deprecate"
>> garbage. None of this "blame other developers because they use the old
>> interface".
>>
>
> How about "let developers know, people are actively working to replace
> this old, bad* API with a better alternative so at least don't
> (unknowingly) sabotage their efforts"?

Perhaps the old API could be hidden in the header files unless
an appropriate macro is defined before including the headers.
Something like:

#define I_REALLY_REALLY_WANT_TO_USE_THIS_OLD_JANKY_API

Everything can be mass converted to that safely, and any random
stragglers can be updated quickly.

At which point any new uses will be at least give people a hint
that something else is going on.  There would still be a lot of
cat herding involved to get the conversion done.

Finding uses of the old api would be a simple as grepping for the
define, or changing the define in the header and doing a complete
kernel build.

Eric

