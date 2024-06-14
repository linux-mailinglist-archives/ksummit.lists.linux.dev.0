Return-Path: <ksummit+bounces-1259-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72808908049
	for <lists@lfdr.de>; Fri, 14 Jun 2024 02:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58AD31C219BC
	for <lists@lfdr.de>; Fri, 14 Jun 2024 00:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1581C27;
	Fri, 14 Jun 2024 00:50:33 +0000 (UTC)
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FB04A11
	for <ksummit@lists.linux.dev>; Fri, 14 Jun 2024 00:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718326233; cv=none; b=C4sfgLd06l0MxwFfvcgXeA3tZb0rA9IcE+TcJUkEr689HGTJUU9TJhRKWdUaEuC4Zt8vIkW12AAQUixdYLDla7GaStl9dRt4osHRwu0oWnHdSYz9gvoAp+gt7NKtNdMGb/o9yvgji64vmuuShzryE4I17+AWAi4ZRYXnWiAVi+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718326233; c=relaxed/simple;
	bh=trpkZYh0pQWxDA8g8picCBz/wpMWTsQuejR3lgj0XJk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cv6fO8Bkg74zLr6DcQG8TxPcFrpMn4jIIQAZLM2jNxx/1SDrvhuYAXGYTCCvqMxCsPAu53OlQt+3nO6v9GDRfyTBHiOdGMl1gACNS5VIMZuuAzBVOUDrDawYo/H87Pakgj3NkMp7hMz9X0s2fU49kEy64tPBreLkOIPEMNkfVXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92FB1C4AF1A;
	Fri, 14 Jun 2024 00:50:32 +0000 (UTC)
Date: Thu, 13 Jun 2024 20:50:29 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, "ksummit@lists.linux.dev"
 <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [2/4] Ensure recent mainline regression
 are fixed in latest stable series
Message-ID: <20240613205029.42b9970f@rorschach.local.home>
In-Reply-To: <20240613112848.GG6019@pendragon.ideasonboard.com>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
	<c10b7cb2-6ea8-4a15-86a7-9ae689064f6b@leemhuis.info>
	<20240613112848.GG6019@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Jun 2024 14:28:48 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> Hi Thorsten,

Hi Thorsten,

I'm sure you had your flame suit on when you posted this ;-)

>=20
> On Thu, Jun 13, 2024 at 10:32:27AM +0200, Thorsten Leemhuis wrote:
> > I propose we extend the implications of the "no regressions" rule so
> > that mainline developers must ensure fixes for recent mainline
> > regression make it to the latest stable series.
> >=20
> > [FWIW, yes I'm well aware that this is a bold proposal; I also have no
> > idea how even Linus thinks about the idea. But I'm bringing it up anyway
> > to at least discuss this, as from my point of view it would fix what I
> > consider a kind of loophole regarding our "no regressions" rule -- at
> > least from the point of view of the users.]
> >=20
> > We might have a "no regressions" rule, but nothing currently makes sure
> > that regressions introduced recently are fixed in a timely manner in the
> > latest stable series. Hence a fix for a regression found just hours
> > after a new mainline release (say 6.7) might only reach users weeks
> > later with its successor (e.g. 6.8) -- or in unlucky cases when the fix
> > is only merged in the next merge window and not backported only with the
> > second successor (6.9). The example scenario at the start of this thread
> > illustrates that in more details.
> >=20
> > To improve this situation I propose we add a rule like the following
> > somewhere:
> >=20
> > """Developers must ensure that fixes for regressions introduced in the
> > last development cycle make it to the latest stable series -- typically
> > by adding 'Fixes:' and 'CC: <stable=E2=80=A6' tags to the patch descrip=
tion's
> > footer.""" =20
>=20
> I think there's a general agreement that those tags are useful, should
> be used, and are already widely used. Reminding everybody, be they
> maintainers or not, is fine with me. Making this an extra strict duty
> for maintainers, however, is something I can't support. We already have
> a bad maintainer burnout problem, and this would make it worse,
> resulting in a worse long term outcome in my opinion.
>=20
> I would be more interested in exploring why regression fixes don't end
> up in stable releases in a timely manner, and seeing how we could
> improve that at no cost for maintainers. We may even be able to come up
> with processes and tools that, when used right, would save time for
> maintainers. That would have a higher chance of getting broader
> adoption.

When reading this thread I was thinking somewhat the same thing. I like
knowing about regressions, and having a way to track them. What would
really be helpful is to have more ways to be able to catch regressions,
and possibly better tooling to find where they started.

I think the focus on this is to make it easier for maintainers to see
there's a regression and where it started. But there should not be any
requirement that the maintainer must deal with it. It could be
something that others working in that subsystem could track. This could
be used for those that want to start kernel development and keep asking
us "do you have any todo list?". Well, this looks like the perfect todo
list for people to take on.

-- Steve

