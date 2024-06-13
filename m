Return-Path: <ksummit+bounces-1231-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F469066AE
	for <lists@lfdr.de>; Thu, 13 Jun 2024 10:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBCFAB24C66
	for <lists@lfdr.de>; Thu, 13 Jun 2024 08:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5AC13D623;
	Thu, 13 Jun 2024 08:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="BylKvGAq"
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBFA13DB96
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 08:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718267204; cv=none; b=mo47snGmEBNppXL7NysQ5VjmYl0DbLctUxPpYDDKvzNRX2aJXPMYhJN5xYyEycBWxXlZZX6FfespHj8+LoMD+BFviTGuSBsgNzqOcy0hvfN45jTw8l8qfKc4EUNx2BQoIJ0cexx85ptGefMmip6OqFXjLfvLzQAExANddIGjtOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718267204; c=relaxed/simple;
	bh=Tx2qf6Ni8rXq9W9cNmxZdbq0w5VmjCttkmZBwNYzTAo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=NQ3C5H+K98vg+B+Kdv0/KdOjfgCmT91Jyi2ajecxazN/wgmqm/1NpMMG8pC1KTyWcnDbPGxBMQd/W1u11DIUqTqfVEX2MF0fJOZk02LKNL1Vwe05mt2JNbSd5pfLdSmlOpQHfQ9wifMAqCsO+0onpx/WA011569KOzCJQGBq3IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=BylKvGAq; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=8c8NHZRSbIFg8F6NSztBYAyXFybncDEskrd/bfAa0Vs=; t=1718267201;
	x=1718699201; b=BylKvGAqaWp+i0utzyub+rVRFjXeoQY3HQZIbFQENLYxQe20nwUAC4Kmx8QVm
	va6G738w/XOz6c2GO3K22hLg+LPe0wgLg+ZZyF2C9ebwHmnjx71hjHQRoVQXL4nBfEDAhpwVkjjT3
	CKNb+n9lJeX7Dxv+TDPV3ujiMmq+po+mtHmdKMe8PseF6Lp6+tnQCzI0mGmfrkahUgFAvvtVRIq1J
	EZDj9jibNcOxsmvRliBJbqR+C8RgS34bplFtx3u1oDOTszRj9wwOgZRebM38qdzDZ5VHSqcu4QdH7
	gHUN3o3MdsjqCnr/CuTeOl9pYTDaWRGNlzXshqY+hwcERYSWXQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sHfn5-0003GV-NM; Thu, 13 Jun 2024 10:26:39 +0200
Message-ID: <e44af14b-1c5d-479c-8752-8f4d52a00c63@leemhuis.info>
Date: Thu, 13 Jun 2024 10:26:39 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [MAINTAINERS SUMMIT] [1/4] Create written down guidelines for
 handling regressions
From: Thorsten Leemhuis <linux@leemhuis.info>
To: "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
Content-Language: en-US, de-DE
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 n7RI
In-Reply-To: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1718267201;08ddc5c8;
X-HE-SMSGID: 1sHfn5-0003GV-NM

Different assumptions about the appropriate handling of regressions
frequently lead to friction and time consuming discussions during my
regression tracking and prodding work. That is frustrating, demotivating
and exhausting for everyone involved and even brought us to situations
like "then I'm stepping down as maintainer". To avoid things like this,
I propose we try to pin down guidelines together and ideally make Linus
bless them.

The "Expectations and best practices for fixing regressions" in
Documentation/process/handling-regressions.rst (
https://docs.kernel.org/process/handling-regressions.html#expectations-and-best-practices-for-fixing-regressions
) could be a start for such guidelines -- but I'm obviously biased here,
as I wrote that text, so feel free to propose something new.

That text is based on generalized interpretations of statements and
actions from Linus while keeping practical application and our workflows
in mind -- including the maintenance of stable trees. I have no idea if
I went too far somewhere: the submission of that text was addressed to
Linus, but he did not react; otoh he merged it later after Greg ACKed it
and it came to his doorstep through the docs tree.

But in the end it seems most people do not know about this text or do
not take it for real. That's why I'd like to make this more official or
create something new that is blessed and widely accepted, despite all
the downsides that "writing things down" sometimes has. That means that
the text likely should be moved somewhere else closer to
Documentation/process/submitting-patches.rst and/or to
Documentation/process/6.Followthrough.rst maybe.

That "Expectations and best practices for fixing regressions" has a
short section that basically says everything crucial in generic way already:

> As a Linux kernel developer, you are expected to give your best to prevent
> situations where a regression caused by a recent change of yours leaves users
> only these options:
>
>  * Run a kernel with a regression that impacts usage.
>
>  * Switch to an older or newer kernel series.
>
>  * Continue running an outdated and thus potentially insecure kernel for more
>    than three weeks after the regression's culprit was identified. Ideally it
>    should be less than two. And it ought to be just a few days, if the issue is
>    severe or affects many users -- either in general or in prevalent
>    environments.

This thus should already prevent all variations of the example scenario
the mail at the start of this thread covered. So maybe this is enough
already.

Fun fact: in an earlier version of that text (which was in mainline for
about a year and also ACKed by Greg) it was more like "within two weeks,
ideally one"; but that afaics turned out to be too demanding, especially
for subsystem maintainers, as then they would definitely have to send
PRs more often to reach that target. This and other practical aspects
are also the reason why the text continues with more detailed instructions:

> How to realize that in practice depends on various factors. Use the following
> rules of thumb as a guide.

Let me comment on some of the other points in case we want to use them
as a base for guidelines. Again, many of the underlying problems that
lead to the following points can be seen in the scenario at the start of
the thread.

> In general:
>
>  * Prioritize work on regressions over all other Linux kernel work, unless the
>    latter concerns a severe issue (e.g. acute security vulnerability, data loss,
>    bricked hardware, ...).
>
>  * Expedite fixing mainline regressions that recently made it into a proper
>    mainline, stable, or longterm release (either directly or via backport).

Note: The "stable, or longterm release (either directly or via
backport)" in this point is just from my interpretation, not sure what
Linus thinks about it. Proposal 3/4 will focus on that, so maybe ignore
this part here.

Another note: That "recently" in the second point becomes more concrete
in later points (see quotes below; yes, this is not really ideal and
maybe should be fixed) and is based on
https://lore.kernel.org/all/CAHk-=wis_qQy4oDNynNKi5b7Qhosmxtoj1jxo5wmB6SRUwQUBQ@mail.gmail.com/

>  * Do not consider regressions from the current cycle as something that can wait
>    till the end of the cycle, as the issue might discourage or prevent users and
>    CI systems from testing mainline now or generally.

Not sure if this and the two points before it are really what Linus
wants, but from his actions it seemed to me it's something like that.

>  * Work with the required care to avoid additional or bigger damage, even if
>    resolving an issue then might take longer than outlined below.

FWIW, this obviously provides a loophole that could be used in any
situation -- but at the same time I think it's wise to have it here for
cases where reverts are not an option and a proper fix takes time to get
right.

> On timing once the culprit of a regression is known:
>
>  * Aim to mainline a fix within two or three days, if the issue is severe or
>    bothering many users -- either in general or in prevalent conditions like a
>    particular hardware environment, distribution, or stable/longterm series.

Note, ignore...

>  * Aim to mainline a fix by Sunday after the next, if the culprit made it
>    into a recent mainline, stable, or longterm release (either directly or via
>    backport); if the culprit became known early during a week and is simple to
>    resolve, try to mainline the fix within the same week.

...this point here, as proposal 3/4 will cover that in more detail.

>  * For other regressions, aim to mainline fixes before the hindmost Sunday
>    within the next three weeks. One or two Sundays later are acceptable, if the
>    regression is something people can live with easily for a while -- like a
>    mild performance regression.

FWIW, I chose this "Sunday after the next", "hindmost Sunday within the
next three weeks", … approach so that subsystem maintainers normally
have no extra work if they flush their fixes at the end of the week,
which quite a few do. And when it comes to regression that imho is a
wise approach, as that ensures the fix makes it into the next -rc. It
often also aligns nicely with stable trees, as that way the fix one or
two days later might already be in the next stable-rc, as they are often
released on Mondays or Tuesdays (at least they usually did before Greg
put even more load on his already overburdened shoulders with the CVE
stuff a few months ago...).

>  * It's strongly discouraged to delay mainlining regression fixes till the next
>    merge window, except when the fix is extraordinarily risky or when the
>    culprit was mainlined more than a year ago.

This used to be a big problem and already got somewhat better, but there
is still quite a bit of room for improvement from what I see.

> On procedure:
>
>  * Always consider reverting the culprit, as it's often the quickest and least
>    dangerous way to fix a regression. Don't worry about mainlining a fixed
>    variant later: that should be straight-forward, as most of the code went
>    through review once already.

This was meant to encourage reverts, as some people see them as
something bad -- when in reality it in kernel context Linus afaics wants
them to be seen as "this was not ready, no big deal, just revert and
reapply in a few weeks together with a fix". Wondering how if we should
do something to get that better across.

>  * Try to resolve any regressions introduced in mainline during the past
>    twelve months before the current development cycle ends: Linus wants such
>    regressions to be handled like those from the current cycle, unless fixing
>    bears unusual risks.
>
>  * Consider CCing Linus on discussions or patch review, if a regression seems
>    tangly. Do the same in precarious or urgent cases -- especially if the
>    subsystem maintainer might be unavailable. Also CC the stable team, when you
>    know such a regression made it into a mainline, stable, or longterm release.
>
>  * For urgent regressions, consider asking Linus to pick up the fix straight
>    from the mailing list: he is totally fine with that for uncontroversial
>    fixes. Ideally though such requests should happen in accordance with the
>    subsystem maintainers or come directly from them.
>
>  * In case you are unsure if a fix is worth the risk applying just days before
>    a new mainline release, send Linus a mail with the usual lists and people in
>    CC; in it, summarize the situation while asking him to consider picking up
>    the fix straight from the list. He then himself can make the call and when
>    needed even postpone the release. Such requests again should ideally happen
>    in accordance with the subsystem maintainers or come directly from them.
>
> Regarding stable and longterm kernels:
>
>  * You are free to leave regressions to the stable team, if they at no point in
>    time occurred with mainline or were fixed there already.

Ignore...

>  * If a regression made it into a proper mainline release during the past
>    twelve months, ensure to tag the fix with "Cc: stable@vger.kernel.org", as a
>    "Fixes:" tag alone does not guarantee a backport. Please add the same tag,
>    in case you know the culprit was backported to stable or longterm kernels.

...this point here, as proposal 2/4 will cover it.

>  * When receiving reports about regressions in recent stable or longterm kernel
>    series, please evaluate at least briefly if the issue might happen in current
>    mainline as well -- and if that seems likely, take hold of the report. If in
>    doubt, ask the reporter to check mainline.
>
>  * Whenever you want to swiftly resolve a regression that recently also made it
>    into a proper mainline, stable, or longterm release, fix it quickly in
>    mainline; when appropriate thus involve Linus to fast-track the fix (see
>    above). That's because the stable team normally does neither revert nor fix
>    any changes that cause the same problems in mainline.
>
>  * In case of urgent regression fixes you might want to ensure prompt
>    backporting by dropping the stable team a note once the fix was mainlined;
>    this is especially advisable during merge windows and shortly thereafter, as
>    the fix otherwise might land at the end of a huge patch queue.
>
> On patch flow:
>
>  * Developers, when trying to reach the time periods mentioned above, remember
>    to account for the time it takes to get fixes tested, reviewed, and merged by
>    Linus, ideally with them being in linux-next at least briefly. Hence, if a
>    fix is urgent, make it obvious to ensure others handle it appropriately.
>
>  * Reviewers, you are kindly asked to assist developers in reaching the time
>    periods mentioned above by reviewing regression fixes in a timely manner.
>
>  * Subsystem maintainers,

FWIW, there is one problem related to this and the previous point that I
haven't written a proposal for, but maybe should have: reviewers and
subsystem maintainers have no dead simple and reliable way to detect
"ohh, this is a regression fix I maybe should prioritize".

Some agreed on tag in the subject could help. [REGFIX]? [URGENT]?
[FASTTRACK]? Hmmm, do not really like any of them, except maybe the
last... :-/

A `Cc: regressions@lists.linux.dev` as well, but would be yet another
tag and harder to spot. :-/ Yes, I mentioned the latter idea two years
ago already without success. But some people started doing it since
then, which is nice, as it helps me keep an eye on things or to become
aware of regressions; it would also allow me to easily spot regression
fixes that are queued for the next cycle that instead might better be
merged in the current cycle.

> you likewise are encouraged to expedite the handling
>    of regression fixes. Thus evaluate if skipping linux-next is an option for
>    the particular fix. Also consider sending git pull requests more often than
>    usual when needed. And try to avoid holding onto regression fixes over
>    weekends -- especially when the fix is marked for backporting.

If all subsystems would usually abide by this point, many regressions
would be fixed quite a bit faster from what I see, as "fixes are sitting
in subsystem trees for one or more weeks and are sometimes flushed
shortly after a new rc" is the aspect that from my point of view
currently is the one that is causing most delays (note: for a few
subsystems that is not a problem at all, they are good at this!).

