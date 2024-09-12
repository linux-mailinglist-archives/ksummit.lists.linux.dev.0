Return-Path: <ksummit+bounces-1564-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE820976ABF
	for <lists@lfdr.de>; Thu, 12 Sep 2024 15:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E35BD1C23A48
	for <lists@lfdr.de>; Thu, 12 Sep 2024 13:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594781AB6F9;
	Thu, 12 Sep 2024 13:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="E5VPX/l1"
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C58E1A4E84
	for <ksummit@lists.linux.dev>; Thu, 12 Sep 2024 13:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726148044; cv=none; b=szQg2y9uc55Pm3qnUmhAKrvC9VaZ/rT/c7OCmdyAZS5INFjbqBZsAyQbeKVgl//l8mFxpyt2e1D2txifwimRwGJgIcSon3aTv7G3cptsXeBLQSE0eFfA59E4MdfsV1OoXwyGzX9m38miNsNG399kDFlOHPrvS8KRkUB47YLiSSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726148044; c=relaxed/simple;
	bh=Kc7g0E6m4ouNjunBgc1qiNTrNr1k99g9RiznQ7nKQBw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=ZT9etLd20u2WOYnQC/4jM9PWZamohhkNlF997JfdSlbN0WQ4kR0WypvwvSNYIiPEROaYhXQBtUu+0Q+0keqGlOtBtV0ERBU8y0fXnIo8J3yTbHQVDS6ooclFItytRu6uskndWtbx0K0zSuSHa0Jx6+MzwgMHKMgEOKY7zpx0oYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=E5VPX/l1; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=Q2dV7QDnW53fgCFqbqjaOaEfFktqmm2VjHbxZgp8vy4=; t=1726148042;
	x=1726580042; b=E5VPX/l1nThMeQSpox/+7GI5WfbZtJnF64inAUv/+nHGSVkEGCwqQ4QAF3fL0
	2aErWdfd8OusjFOZzxRbWpkr7bb5NkhnhfYqSyKWDYkZ0ikKh37t8yNsZKTGmqqTxdZau2IRUUT2/
	P/xucmEXnSdqDWpTeoxLVRIH3/0LPQ+pYHYeqExhSWeoGka7PjOrgVrZxKz8UHfZ4CtLZGIhuiCmw
	3Z7PZIgbb6ZEdhjwumDep/ci8pXNVnsun1fD1/JcRjwk43hXcL42Dz090rSGhl7wrmSoBBipCkZ9P
	tveOGssTzhrkUqDcTlNveEWFO/IQ0qGs2lBMBS5KzdR+kqZQdw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sojxQ-0001cZ-8Y; Thu, 12 Sep 2024 15:34:00 +0200
Message-ID: <aea2022a-e2b4-4d38-95db-c0006e6a7146@leemhuis.info>
Date: Thu, 12 Sep 2024 15:33:59 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS SUMMIT] [1/4] Create written down guidelines for
 handling regressions
From: Thorsten Leemhuis <linux@leemhuis.info>
To: "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e44af14b-1c5d-479c-8752-8f4d52a00c63@leemhuis.info>
Content-Language: en-US, de-DE
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 n7RI
In-Reply-To: <e44af14b-1c5d-479c-8752-8f4d52a00c63@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1726148042;74033932;
X-HE-SMSGID: 1sojxQ-0001cZ-8Y

On 13.06.24 10:26, Thorsten Leemhuis wrote:
> Different assumptions about the appropriate handling of regressions
> frequently lead to friction and time consuming discussions during my
> regression tracking and prodding work. That is frustrating, demotivating
> and exhausting for everyone involved and even brought us to situations
> like "then I'm stepping down as maintainer". To avoid things like this,
> I propose we try to pin down guidelines together and ideally make Linus
> bless them.
> 
> The "Expectations and best practices for fixing regressions" in
> Documentation/process/handling-regressions.rst (
> https://docs.kernel.org/process/handling-regressions.html#expectations-and-best-practices-for-fixing-regressions
> ) could be a start for such guidelines -- but I'm obviously biased here,
> as I wrote that text, so feel free to propose something new.
> 
> That text is based on generalized interpretations of statements and
> actions from Linus while keeping practical application and our workflows
> in mind -- including the maintenance of stable trees. I have no idea if
> I went too far somewhere: the submission of that text was addressed to
> Linus, but he did not react; otoh he merged it later after Greg ACKed it
> and it came to his doorstep through the docs tree.
> 
> But in the end it seems most people do not know about this text or do
> not take it for real. [...]

Lo! The discussion here rightfully exposed that the wording regarding
the stable tag was way to strong. Sorry for that, not sure how that
happened, that was not my intend. That and a few other aspects (some
from the discussions here) made me revisit the text regarding
"Expectations and best practices for fixing regressions". See below for
my current draft (the diff view is not really helpful, sorry). Note,
should be easy to add a week or two to any sections regarding the
timing aspects; guess that is best discussed on the summit.

As I said earlier, the text is based on generalized interpretations of
statements and actions from Linus with some interpolation. But in some
areas what I wrote might be not what Linus wants. To sort this out I'm
currently also preparing a few scenarios with related questions for the
maintainers summit audience (incl. Linus) that hopefully will help to
keep the discussion fruitful, targeted, and as short as possible. More
on that on Tuesday.

Ciao, Thorsten
---

Expectations and best practices for fixing regressions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Try to quickly resolve regressions in mainline while applying reasonable care to
prevent additional problems. The appropriate balance depends on the situation;
most regressions should ideally be resolved through a fix or a revert by the
last Sunday within the next two or three weeks after the culprit was identified.

The rules of thumb below outline the appropriate procedure in more detail. The
overall goal is to prevent situations where a regression caused by a recent
change leaves users only three bad options: use a kernel with a regression that
impacts usage, switch to a different kernel series, or run an outdated and thus
potentially insecure kernel for more than two or three weeks. 

In general:

 * Prioritize work on providing, reviewing, and mainlining regression fixes over
   other upstream Linux kernel work, unless the latter concerns severe issues
   (e.g. acute security vulnerabilities, data loss, or bricked hardware).

 * Do not consider fixing regressions from the current development cycle as
   something that can wait till its end: the issue possibly prevents users or
   CI systems from testing, which might drive testers away and mask other bugs.

 * When developing a fix, apply the required care to avoid additional damage. Do
   so even when resolving a regression might take longer than outlined below --
   at least unless a revert could resolve it, as then you should opt for one.

 * Reviewers and maintainers likewise should apply the required care, but at the
   same time should try to route regression fixes quickly through the ranks.

On timing once the change causing the regression became known:

 * If the regression is severe, aim to mainline a fix within two or three work
   days and ideally before the next Sunday; do the same it its is bothering many
   users in general or most people in prevalent environments (say a widespread 
   hardware device, a popular Linux distribution, or a stable/longterm series).

 * Aim to mainline a fix by Sunday after the next, if the culprit made it into
   a kernel deemed for end users during the past three months -- either directly
   through a mainline release or through backports to stable or longterm series.
   If the culprit became known early during a week while being simple to resolve
   using a low-risk patch, try to mainline the fix within the same week instead.

 * For other regressions introduced during the past twelve months, aim to
   mainline a fix before the hindmost Sunday within the next three weeks. One or
   two weeks later are acceptable, if the regression is unlikely to bother more
   than a user or two or is something people can easily live with temporarily.

 * Try your best to mainline a fix before the current development cycle ends,
   unless the culprit was committed more than a year ago: then it is acceptable
   to queue a fix for the next merge window, which definitely should be done in
   case it bear bigger risks.

On patch flow to mainline:

 * Developers, when trying to reach the time periods mentioned above, remember
   to account for the time it will take to test, review, commit, and mainline
   fixes, ideally with them being in linux-next at least briefly. Hence, if
   fixes are urgent, make it obvious to ensure others handle them appropriately.

 * Reviewers, you are kindly asked to assist developers in reaching the time
   periods mentioned above by reviewing regression fixes in a timely manner.

 * Maintainers, you likewise are kindly asked to expedite the handling
   of regression fixes. Thus when beneficial evaluate if skipping linux-next
   might be an option. Also consider sending git pull requests more often than
   usual when appropriate. And try to avoid holding onto regression fixes over
   weekends -- especially when some are marked for backporting to stable series.

On procedure:

 * If a regression seems tangly, precarious or urgent, consider CCing Linus on
   discussions or patch review; do the same if the responsible maintainers
   suspected to be unavailable. 

 * For an urgent regression, consider asking Linus to pick up a fix straight
   from the mailing list: he is totally fine with that for uncontroversial
   fixes. Such requests should ideally come directly from maintainers or happen
   in accordance with them.

 * In case you are unsure if a fix is worth the risk applying just days before
   a new mainline release, send Linus a mail with the usual lists and developers
   in CC; in it, summarize the situation while asking to pick up the fix
   straight from the list. Linus then can make the call and when appropriate
   even postpone the release. Such requests again should ideally come directly
   from maintainers or happen in accordance with them.

On tagging in the patch description:

 * Include the tags Documentation/process/submitting-patches.rst mentions for
   regressions; this usually means a "Reported-by:" tag followed by "Link:" or
   "Closes:" tag pointing to the report as well as a "Fixes:" tag; if it's a
   regression a later change exposed, add a "Fixes:" tag for that one, too.

 * Did the culprit make it into a proper mainline release during the past twelve
   months? Or is it a recent mainline commit backported to stable or longterm
   releases in the past few weeks? Then you are kindly asked to ensure stable
   inclusion as described by Documentation/process/stable-kernel-rules.rst, e.g.
   by adding a "Cc: stable@vger.kernel.org" to the patch description. Note, a
   "Fixes:" tag alone does not guarantee a backport: the stable team sometimes
   silently drop such changes, for example when they do not apply cleanly.

Regarding stable and longterm kernels:

 * When receiving reports about regressions in recent stable or longterm kernel
   series, please consider evaluating at least briefly, if the issue might
   happen in current mainline as well -- and if that seems likely, take hold of
   the report. If in doubt, ask the reporter to check mainline.

 * You are free to leave handling regressions to the stable team, if the problem
   at no point in time occurred with mainline or was fixed there already.

 * Whenever you want to swiftly resolve a mainline regression that recently made
   it into a mainline, stable, or longterm release, fix it quickly in mainline;
   in urgent cases thus involve Linus to fast-track fixes (see above). That's
   required, as the stable team normally does neither revert nor fix any changes
   in their trees as long as those cause the same problem in mainline.

 * In case of urgent fixes for regression affecting stable or longterm kernels,
   you might want to ensure prompt backporting by dropping the stable team a
   note once the fix was mainlined; this is especially advisable during merge
   windows and shortly thereafter, as the fix otherwise might land at the end
   of a huge patch queue.

