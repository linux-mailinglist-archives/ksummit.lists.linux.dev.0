Return-Path: <ksummit+bounces-451-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C563D4AB0
	for <lists@lfdr.de>; Sun, 25 Jul 2021 01:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 5E26C3E0ECD
	for <lists@lfdr.de>; Sat, 24 Jul 2021 23:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008CB2FB6;
	Sat, 24 Jul 2021 23:47:07 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964E229D6
	for <ksummit@lists.linux.dev>; Sat, 24 Jul 2021 23:47:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 21D7E1FD93;
	Sat, 24 Jul 2021 23:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1627170418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TPHEXW7Fo2Tubq45pnfOEj7Ou7Dzne3nt5/ga3YfoUo=;
	b=n+T2qW6fSPaPqxRca5o7mooZZn5aDxvz7rXdap/Q/lJPI5EV8UAjRVthba+uz/MM0/I3x5
	UugouPMMsmRYDHMd+Au2gD6Cj/zUgjx4cWB46jGhKscjXXQ1pu2iN37hIUgezD2shIPo/e
	WH/flVxrkanLZPiGL5isdwntRXRqYtQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1627170418;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TPHEXW7Fo2Tubq45pnfOEj7Ou7Dzne3nt5/ga3YfoUo=;
	b=/nLiPxpjlAPPlQlQC9H6/jg0hHgGg5BoYV4xttK12vZVJRqqI4/iXjkFRkRiHGaacQDxN/
	6sNsQZhawn3y6XDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5755313E1D;
	Sat, 24 Jul 2021 23:46:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WLOUA3Cm/GATZQAAMHmgww
	(envelope-from <neilb@suse.de>); Sat, 24 Jul 2021 23:46:56 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Dan Carpenter" <dan.carpenter@oracle.com>, ksummit@lists.linux.dev,
 "Julia Lawall" <julia.lawall@inria.fr>
Subject: Re: Potential static analysis ideas
In-reply-to: <YPyf4NkpONFhrbuw@pendragon.ideasonboard.com>
References: <20210723191023.GG25548@kadam>,
 <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>,
 <YPyf4NkpONFhrbuw@pendragon.ideasonboard.com>
Date: Sun, 25 Jul 2021 09:45:37 +1000
Message-id: <162717033769.3676.6942299974175827854@noble.neil.brown.name>

On Sun, 25 Jul 2021, Laurent Pinchart wrote:
> On Sat, Jul 24, 2021 at 03:33:48PM +0200, Geert Uytterhoeven wrote:
> > On Fri, Jul 23, 2021 at 9:11 PM Dan Carpenter wrote:
> > > These days we have disabled GCC's uninitialized warnings so it falls
> > > to static analysis devs to review all the new warnings.  I sometimes
> > > ignore warnings if they look like probably they aren't a bug.  Does this
> > > function allow zero size writes?  Does this switch statement really need
> > > a default case?  Maybe sometimes I miss bugs.
> >=20
> > Yeah, I tended to find a few real bugs every release using the good old
> > gcc 4.2, before support for it was dropped.
> > I hope someone still runs modern compilers with GCC's uninitialized
> > warnings enabled again?
> >=20
> > > Here is another example of something which I have a check for but I
> > > haven't pushed.
> > >
> > >         ret =3D frob();
> > >         if (!ret)
> > >                 return ret;
> > >
> > > This code is normally correct but sometimes it means the if statement is
> > > reversed and it should be "if (ret) return ret;".  To me returning a
> > > literal is always more clear but but clearly the original author felt
> > > "ret" was more clear...  It's only a few bugs per year so it's not a big
> > > deal either way.
> >=20
> > To make it work well, you need to know if frob() and/or the current
> > function return an error code or not.  While you can use some heuristics
> > (e.g. is there any return -Exxx), perhaps we can add an annotation to
> > indicate if a function returns an error code, or an error pointer?
>=20
> https://lore.kernel.org/linux-media/YNMvarFl%2FKU1pGCG@pendragon.ideasonboa=
rd.com/
>=20
> I think it would be useful, if not for the tools, at least for
> developers.

Agreed.  I added some code to smatch so that I could annotate pointers to
say if they are allowed to be NULL.  The implementation isn't perfect,
but I love having that extra documentation about when I do or don't have
to check for NULL.

NeilBrown

