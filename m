Return-Path: <ksummit+bounces-903-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 984835F3270
	for <lists@lfdr.de>; Mon,  3 Oct 2022 17:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AA4E1C2094C
	for <lists@lfdr.de>; Mon,  3 Oct 2022 15:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628A517D8;
	Mon,  3 Oct 2022 15:26:08 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB837C;
	Mon,  3 Oct 2022 15:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F69EC433D7;
	Mon,  3 Oct 2022 15:26:05 +0000 (UTC)
Date: Mon, 3 Oct 2022 11:26:05 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Slade Watkins <srw@sladewatkins.net>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, "Artem S. Tashkinov" <aros@gmx.com>,
 workflows@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>, ksummit@lists.linux.dev
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20221003112605.4d5ec4e9@gandalf.local.home>
In-Reply-To: <e9dd6af0-37ef-1195-0d3b-95601d1ab902@leemhuis.info>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
	<05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
	<63a8403d-b937-f870-3a9e-f92232d5306c@leemhuis.info>
	<534EB870-3AAE-4986-95F3-0E9AD9FCE45B@sladewatkins.net>
	<e9dd6af0-37ef-1195-0d3b-95601d1ab902@leemhuis.info>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 3 Oct 2022 14:59:54 +0200
Thorsten Leemhuis <linux@leemhuis.info> wrote:

> > With the band-aids you outline in place: do you think it would it be
> > beneficial to have a liaison holding users=E2=80=99s hands through the
> > process, _then_ triaging to developers by contacting them with the
> > information they need? =20
>=20
> Well, yes and no. :-/
>=20
> Thing is: up to a point that's something I do already (and will likely
> continue to do at least for a while) when the reported issue is a
> regression. But to be fair, I often could help way more if I wanted to,
> but there are only so many hours in a day and other things to take care
> of (regression tracking is only a part-time thing for me currently). So
> some help there might be handy; would get load of the developers as
> well, as they often are more willing to help users when a report is
> about a regression.

Are you asking for help in the regression tracking?

>=20
> But for other issues (aka regular bugs) I don't think it's worth it,
> because why only help those users that report to bugzilla (you didn't
> say that, but it sounded to me like the focus is on it)? There are
> people that try to use the mailing lists, but do it badly and never get
> a reply (for example because they sent their report just to LKML). They
> could need help, too; maybe helping them should even be priority, as
> they at least tried to do what most kernel developers want them to do,
> hence their reports might be better, too.

Could do both.

>=20
> But there is a more important reason why I think having a liaison might
> not be worth it for now: It IMHO would be much better to spend the time
> and effort on other things that enable users submitting better bug
> reports in the first place. I have no concrete and well-thought-out
> ideas at hand what to do exactly, but here are a few vague ones:
>=20
>  * create an app (ideally usable locally and on the web) that guides
> users through generating a good bug report (let's leave the way of
> submission aside for now). That app could handle quite a few of the
> steps that https://docs.kernel.org/admin-guide/reporting-issues.html
> currently mentions. It for example could check if the kernel looks to be
> vanilla, if the kernel is fresh, if the kernel is tainted, if an Oops is
> the first one or just a follow-up error; maybe that app could even
> decode stack-traces locally in some environments; and it could collect
> and upload logs as well. It could also explain certain things to users
> when not fulfilled, for example why it's not worth to report a problem
> that happens with an old kernel.

Christoph mentioned Debian's reportbug utility. That does a pretty good
job at walking people through how to report a bug. It could also get
information about the current environment that would be useful too. Perhaps
something like that?

>=20
>    Sure, these apps never work perfect and doing it right is a lot of
> work, but I guess one could make things a lot easier for many users
> especially for our case. I assume other projects have done something
> like that so that we could learn from them.
>=20
>  * Improve https://docs.kernel.org/admin-guide/reporting-issues.html
> further. I have some ideas there, but other things are higher on my
> priority list currently. That document in the end somehow needs to
> become less scary looking while still providing all important details
> for situations where a reporter might need them.
>=20
>  * Write new docs relevant for bug reporting. We for example still have
> no well written and simple to understand text that explains bisection to
> people that are new to git, bisection, or compiling kernels in general.
> Speaking of which: we iirc are also missing a text that properly
> explains how to quickly configure and compile a kernel using "make
> localmodconfig" (I mean something like
> http://www.h-online.com/open/features/Good-and-quick-kernel-configuration=
-creation-1403046.html)

The sad part is that most people that are going to report a bug is not
going to read a full document to figure out how to do it. Usually when
someone hits a bug, they are doing something else. And it's a burden to
report it. Obviously, they want it to be fixed, but it's viewed as a favor
to the developer and not the user to get it fixed, as it's likely seen as a
mistake by the developer that the bug exists in the first place.

Having a tool like reportbug that walks you through the steps of reporting
it would be the best way to do so. As the reporter doesn't need to think
too hard and just answer questions and let the tool do all the work.

>=20
>  * Not sure, maybe a list of things that known to be broken might be
> good to have? Like "yes, we know that nouveau is slow, but we can't do
> anything about this" or "driver 'wifi-foo' only supports a small subset
> of the features the hardware offers, so don't report bugs if bar, baz
> and foobar don't work".

The tool could possibly reply with known issues, and state something like
"We are aware of this issue, and are currently trying to figure it out."


-- Steve

