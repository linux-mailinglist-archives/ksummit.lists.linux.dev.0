Return-Path: <ksummit+bounces-2538-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0325ABE0E43
	for <lists@lfdr.de>; Thu, 16 Oct 2025 00:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B55C63B6607
	for <lists@lfdr.de>; Wed, 15 Oct 2025 22:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D65930505E;
	Wed, 15 Oct 2025 22:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="YARS/OO1"
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2BE2FF154
	for <ksummit@lists.linux.dev>; Wed, 15 Oct 2025 22:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760565711; cv=none; b=k07YdKIo3YuCMGAcY6ObnHTz5S5pj3NRia6fDj1zAk9+RGPK1sOYmglx8zLu6MiYjhPEoykkQ0/w1SiH8V/TX69uozpDjX9Ww8INE1Us6v/5EaME8aSWLWWGVXZ/V8Z/YI5YSsSKwvW48epvoY2PKAf2ZpxOWztIPyhXDvvthzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760565711; c=relaxed/simple;
	bh=Q7DHjTE6Gc5xty1yeOIwJbAizdu9YmTPyUqfsfV74QI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UNP8zU30v5Dpds+gInPxMlFlz4AvTnJJdfFpAnxOrjas53SUpdEFnrlf92+RhUHGy/3NTnyLaDI60fajU1eY8Lqr0vvs22zHfnYGISfbBunHzIY+HwaRzZBHzBYTumoFjuTpWeJrY+ogsFTJ7OxXzNigBJrtEQF/iM3J+Q+Do1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=YARS/OO1; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=loe+mHjBDBPWDe4goxXdUKkOQUIqhqV6h6YwKdSaC/o=;
	t=1760565709; x=1761775309; b=YARS/OO1HVrYkX9pK/dGsy9sYwlvGeEizKKzkp1xXNrNemR
	YqiD2oxB/VUmmY1yYkMHA7Tk5VeKDIDjIBff9jHe+pUqsjSpSAIn1PK7q096Gr7B+FLxIP/3AWCl9
	uwEVfwYPUueKk2U4wYxs8vvGUBlyZaUQdulmMxuvHCNUVNiOh5sMTxNzpweevP3Yx3A4qw0rfrv2q
	25KaSFDxdaNYReUxU2+Y1A37puVsztsZHMUyvaowkxyZRq2i2yinK7LpNal+IozzYvJOfzNOJHgYR
	s8BCYayLR0fx7pLHd6cV7RvDt6KD1lOOj/UExurZfS599azopUAUv0W3pHUDYY6g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1v99Yx-0000000F7H3-25WP;
	Thu, 16 Oct 2025 00:01:40 +0200
Message-ID: <c311cf11f2e0bc2046c428e398508010c7626855.camel@sipsolutions.net>
Subject: Re: Replacing Link trailers
From: Johannes Berg <johannes@sipsolutions.net>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, James Bottomley
	 <James.Bottomley@HansenPartnership.com>, "ksummit@lists.linux.dev"
	 <ksummit@lists.linux.dev>
Date: Thu, 16 Oct 2025 00:01:38 +0200
In-Reply-To: <20251014153521.693907a1@gandalf.local.home>
References: 
	<a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
		<6b188d9e-3d47-4a30-8452-3e57e09cf8e3@efficios.com>
		<8572506ccdaa6211e177d5976a74737268486492.camel@sipsolutions.net>
	 <20251014153521.693907a1@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Tue, 2025-10-14 at 15:35 -0400, Steven Rostedt wrote:
> On Tue, 14 Oct 2025 21:12:33 +0200
> Johannes Berg <johannes@sipsolutions.net> wrote:
>=20
> > And we're taking it away because literally *one* person thinks that it
> > adds irrelevant noise.
>=20
> Are you suggesting that we lost the "benevolent" in our "benevolent dicta=
tor"?
>=20
>   ;-)

So I'm supposed to be on vacation this week, but this is haunting me I
guess ... I see your ";-)", but I'll respond anyway.

Yes. Yes, in this particular instance I am absolutely saying that.

To me, there's a sort of underlying (social) contract in all of Linux
etc. - yes, we want/need Linus to enforce the things that make for
unpopular reading in the press (say kicking out bcachefs for a recent
example), but we also trust him to "read the room" (so to speak) and
mostly at least, form an opinion informed by the rough consensus. At
least that's my interpretation of how this all works. Call me deluded if
you like. (Seriously, tell me, even in private messages.)

Here, however, we have the exact opposite. Pretty much everyone in the
threads disagrees and prefers a tag in some form (be it link, message-
id, or something else), and yet Linus insists he's right to be annoyed
and impose his will on everyone. Some people in the threads want to find
technological workarounds for his whims, but really all those are just
that: workarounds, and demonstrably don't work as well.

It's not even a technical problem/discussion, if it were, we'd be
reading messages that take the concerns of those people who currently
rely on the link tags seriously, and try to find solutions that work for
everyone. I'm sure we could think of any number of things, even encoding
the message-id in the git commit object format (so it's invisible with
default git log/show format) itself would probably work pretty easily.
But no, instead we read all about how those people are all wrong and
misguided, and how the patch that got applied isn't special [1]. In
other contexts, we'd probably call this "mansplaining", but here we
somehow are supposed to not only tolerate but celebrate, presumably for
the great technological advancement it brings. [2]

[1] seriously? even if it were posted 100 times identically, the one
that got applied would be made special by the very act of being picked
up by the maintainer

[2] b4 dig is (probably) nice, and Linus will likely somehow manage to
have it interpreted that it was because of his actions that it came
about, although it really wasn't his vision but rather his pettiness
that got it started.


So really, I think this has become purely an ego/power dynamics thing,
far detached from any practical reality. _Not_ clicking a link really
isn't that difficult, and distinguishing between "I've modified a patch
so it needs a link now" and "a lookup by patch-id will succeed so no
link is needed" has now become fig-leaf for the naked emperor. It adds
useless work for everyone, not to mention wasting server cycles to do a
search and all that, all because one guy desperately needed to be right.

(But yes, I'm sure that now that everyone is so entrenched, big ego will
win.)

So yeah, circling back to "benevolent" -- for me, this has definitely
broken the "benevolent" part and a lot of trust. But that's fine, I can
also do a job that heavily resolves around following a manager's
arbitrary whims. But my heart won't be in it.

johannes

