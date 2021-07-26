Return-Path: <ksummit+bounces-471-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D3B3D68D8
	for <lists@lfdr.de>; Mon, 26 Jul 2021 23:43:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 1440B1C0948
	for <lists@lfdr.de>; Mon, 26 Jul 2021 21:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6792FB2;
	Mon, 26 Jul 2021 21:43:17 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345DF72
	for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 21:43:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2FB732008D;
	Mon, 26 Jul 2021 21:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1627335794; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sd/a7NXP8u79DltLwKQUrq+GMWSJUnlPRuPIQKZAgBw=;
	b=j8r/J3trWT9coK5hFDx6lPO7Iqa49atYCzw+yIWyKDilSUGdmasPOY1i1KvAvMgLSN3T0P
	jqPK6UxmKfc7K4Xh0fQH+yqqeU9zLRbLUgafH4W5nK2ivfExb6xRujWVGbrD9OVYLTMjpb
	fwjM1FVjAo5/Ikq3TSfDp5SGafsc3Ho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1627335794;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sd/a7NXP8u79DltLwKQUrq+GMWSJUnlPRuPIQKZAgBw=;
	b=tnr1AQ3LGInDGjCqIQeL2WVYA384n7qfjBbpB8Hrffv1a7WT0SU367NlDP35Vci2HEu+fd
	LRGkpD1E2maW4gCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5576813B58;
	Mon, 26 Jul 2021 21:43:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id q4g3BXAs/2DpQwAAMHmgww
	(envelope-from <neilb@suse.de>); Mon, 26 Jul 2021 21:43:12 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Dan Carpenter" <dan.carpenter@oracle.com>, ksummit@lists.linux.dev,
 "Julia Lawall" <julia.lawall@inria.fr>
Subject: Re: Potential static analysis ideas
In-reply-to:
 <CAK8P3a2nm0fTf9-_sy9RTEaQv0yRqPHv_v+ZMX1yU=Pqj7idzw@mail.gmail.com>
References: <20210723191023.GG25548@kadam>,
 <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>,
 <YPyf4NkpONFhrbuw@pendragon.ideasonboard.com>,
 <162717033769.3676.6942299974175827854@noble.neil.brown.name>,
 <CAK8P3a2nm0fTf9-_sy9RTEaQv0yRqPHv_v+ZMX1yU=Pqj7idzw@mail.gmail.com>
Date: Tue, 27 Jul 2021 07:43:09 +1000
Message-id: <162733578909.4153.5076277531962816764@noble.neil.brown.name>

On Mon, 26 Jul 2021, Arnd Bergmann wrote:
> On Sun, Jul 25, 2021 at 1:45 AM NeilBrown <neilb@suse.de> wrote:
> > On Sun, 25 Jul 2021, Laurent Pinchart wrote:
> > > >
> > > > To make it work well, you need to know if frob() and/or the current
> > > > function return an error code or not.  While you can use some heurist=
ics
> > > > (e.g. is there any return -Exxx), perhaps we can add an annotation to
> > > > indicate if a function returns an error code, or an error pointer?
> > >
> > > https://lore.kernel.org/linux-media/YNMvarFl%2FKU1pGCG@pendragon.ideaso=
nboard.com/
> > >
> > > I think it would be useful, if not for the tools, at least for
> > > developers.
> >
> > Agreed.  I added some code to smatch so that I could annotate pointers to
> > say if they are allowed to be NULL.  The implementation isn't perfect,
> > but I love having that extra documentation about when I do or don't have
> > to check for NULL.
>=20
> I can think of four different annotations that limit what a pointer return =
from
> a function can be:
>=20
> a) either a valid pointer or NULL, but never an error pointer,
> b) either a valid pointer or an error pointer, but not NULL,
> c) always a valid pointer, never NULL or an error,
> d) always NULL, but callers are expected to check for error pointers.
>=20
> The last one is the tricky bit because there are a couple of subsystems
> that intentionally return an opaque NULL pointer to indicate success
> when the subsystem is compile-time disabled, and expect callers to not
> dereference that pointer but instead pass it into other stubbed-out
> interfaces. I think this one is rather specific to the kernel, but also rea=
lly
> useful to have in a static checker because everyone gets those wrong.

And now we see the worms wriggling their way out of the can....

Some pointers can also have the 'lsb' overloaded, sometimes as a
bit-spin-lock.
And pointers stored in a structure can have temporal type requirements -
different at various places in the life cycle.
Most obviously, "non-NULL" pointers can be NULL (or unitiallised) during
inititalization, and may have other inconsistencies during finalization.
But it isn't hard to find more complexity.

"context" structures are particularly suseptible to this.  I've been
looking at 'struct fs_context' recently.  Normally you would use one of
the allocation functions which will always set ->ops and a few other
fields. So maybe ->ops is "always valid".
Then you initialize some extra bits.  Maybe call vfs_parse_fs_string()
etc.
Finally you call vfs_create_mount().  But you *can* call
vfs_create_mount() after only setting ->root ->sb_flags and ->source.
->ops can be uninitialised!

So what annotations would you give to the various fields? To capture
this completely you would need a series of sub-types of 'fs_context',
each with different guarantees or requirements about the values of
different fields.

I love contemplating what the "perfect" system would be, but I doubt a
near-perfect system would be much fun to program in, and that last 20%
to get to perfection would take a while.

So if we wanted to do something like this, it would need to be
completely opt-in.  The default would be current behaviour, and we would
want to have annotations for both what is, and what isn't, promised.

"what is" would be something like "this pointer is never NULL".
"what isn't" would be more like __must_check.  "this pointer might be
NULL and you really have to check before you dereference it".
For an unannotated pointer, it is not an error to test if it is NULL, or
to dereference without testing.

And, of course, we would need to be able to cast between the different
promises.

NeilBrown

