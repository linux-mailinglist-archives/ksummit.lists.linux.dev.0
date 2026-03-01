Return-Path: <ksummit+bounces-2861-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFwaGVFmpGlcfgUAu9opvQ
	(envelope-from <ksummit+bounces-2861-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sun, 01 Mar 2026 17:16:17 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 519891D08FD
	for <lists@lfdr.de>; Sun, 01 Mar 2026 17:16:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67C9F30151E8
	for <lists@lfdr.de>; Sun,  1 Mar 2026 16:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF3130E82C;
	Sun,  1 Mar 2026 16:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yf8GL6vc"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E251E7C12
	for <ksummit@lists.linux.dev>; Sun,  1 Mar 2026 16:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772381766; cv=none; b=BtnGv86K1BAdUgHovsuCKSW8Yrg/woEbjVUe5rbJqnzRvNWRn7P/PMN/J3atdPE/S8Mk85MCMvU3eefz9DzcRIkwrMvjwOZLhHUQvbCqo2vf5HK2lHMrzRP3dM6AtjAKG7PQdO4fzwL1d1XhQFld1ifjxv9gZIUrXe4GmKqV+no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772381766; c=relaxed/simple;
	bh=raL/ohrcmklH1Ot8X4pH+abDuIFvkWIZFdy5siHm2qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QDVrVRVJMerwIWHGEkk47/HdseNVOJRO15N32qE+LbsRUUJqVM+HnaO1WufGb0revnZl/pdxdL1Bi9VtruDCoIEMaUXxdhtS/Zkrr/5WWSyKRVCCxG87EpuWatPWHVSmOcyiMyz8syRLUIWtw2KoP376d4nmLSE7tlHmwFcoK8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yf8GL6vc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5892C116C6;
	Sun,  1 Mar 2026 16:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772381766;
	bh=raL/ohrcmklH1Ot8X4pH+abDuIFvkWIZFdy5siHm2qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yf8GL6vcmC5EWpMV767VHdUJMkeYUICDsCLiWZYe9mf2LQHzD2Ww7+7LL8wGSEN4l
	 Pt6AfSZhcjopp5vfl/F75ZQsXiA/ohZMo5LhaImvcWyWBqZxjPJz6jqdlkzwCiP9HY
	 ws4eQ9Rbdzz8plzS1YsZvnqdG5Tcp+Df8I7fkHlim+QQlg8Z6Ugp4yNxNmZMKqj4qR
	 /pHfhnrgYbNX8eaQ5MVduRDr0YlK/vqOW6BFZmy1RUwRKjouEfNNk06oe4q/h3oHiM
	 8UHWx2wnlrcgQ6VydNoxkwN11LBBPPnAJ1l2HT5p1ua+X3F6wYwwLE0U3iqho9EC0r
	 W9O7zO7Infudw==
Date: Sun, 1 Mar 2026 11:16:04 -0500
From: Sasha Levin <sashal@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Richard Weinberger <richard@nod.at>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users <users@kernel.org>, ksummit <ksummit@lists.linux.dev>
Subject: Re: slowly decommission bugzilla?
Message-ID: <aaRmRGzJutgAruJt@laps>
References: <1655051015.2216.1772209338375.JavaMail.zimbra@nod.at>
 <5dea1bca-75fe-4e3c-950d-d489a438299a@leemhuis.info>
 <1786920159.1633.1772291851870.JavaMail.zimbra@nod.at>
 <CAHk-=wh3fsqZ=KUfm2cnq_D_U63Pk33Q7cs8_QYdyzbPXjE1bw@mail.gmail.com>
 <1661016163.157.1772303364121.JavaMail.zimbra@nod.at>
 <20260228152617.06b392de@fedora>
 <583136576.604.1772310537428.JavaMail.zimbra@nod.at>
 <20260228155611.70911c0f@fedora>
 <aaRZ1EIDE-SlqWOo@laps>
 <f998ee02c352c316e747ce14148449bcbacf6cc7.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f998ee02c352c316e747ce14148449bcbacf6cc7.camel@HansenPartnership.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2861-lists=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 519891D08FD
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 11:01:07AM -0500, James Bottomley wrote:
>On Sun, 2026-03-01 at 10:23 -0500, Sasha Levin wrote:
>[...]
>> As an example, this bug report came in today with no replies:
>>
>>   
>> https://lore.kernel.org/all/DGRCO9SL0T5U.JTINSHJQ9KPK@imlonghao.com/
>>
>> I fed it to an LLM. It decoded the stack trace (as described above),
>> then traced the crash to iptfs_reassem_cont() at xfrm_iptfs.c:905:
>> skb_put() on a non-linear skb. It identified the offending commit
>> (5f2b6a9095743), the code author (Christian Hopps), the relevant
>> maintainers, and a couple more vulnerable call sites in the same
>> function. Not perfect, but enough to get the report to the right
>> people with useful context already attached.
>
>Lore says there's been no follow up to that email ... shouldn't someone
>check with the reporter that the fix actually works?

Hmm? I don't think that there's a fix available yet.

>> What I'd like to propose: set up something like bug@kernel.org with a
>> bot that watches it. When a report comes in, it:
>
>If we're going to link an agent to a mailing list, why not simply have
>it scan all of them?  Something like the way the old ksymoops used to.

We could. In my mind a mail to bug@ would just be a marker for the bot to run
on. Do we have a better way to identify bug reports?

I don't want to send every single incoming mail through the LLM to determine if
it's a bug report or not. That would make it slightly expensive :)

>>   1. Pulls the oops/stack trace from the email (if exists)
>>   2. Figures out the kernel version, obtains or builds debuginfo, and
>>      decodes the stack trace
>>   3. Reads the relevant source, identifies root cause, offending
>> commit,
>>      and the right maintainers/lists
>>   4. Forwards the report with its analysis to the right list, Cc'ing
>>      the right people
>>
>> One email address, no tooling required from the reporter, bugs get to
>> the right list with a decoded stack trace and first-pass analysis.
>> The analysis will be wrong sometimes, but even just the decoded trace
>> and correct routing is better than what bugzilla gives us today.
>
>If an agent is going to be doing this, then the agent could reply with
>the results and add the emails it deduced should be notified.  You can
>add caveat phrases like "Hi I'm an automatic reply from a LLM and I
>think ..."

Yup! In this example, it would reply with the processed report (the one I
linked in the previous mail), but also cc the list of folks it identified in
the "Contacts" section.

>It also looks quite easy for the agent to identify whether this is a
>regression or not and flag that more clearly (and possibly follow up as
>well, which means we get regression tracking back).

Agree

-- 
Thanks,
Sasha

