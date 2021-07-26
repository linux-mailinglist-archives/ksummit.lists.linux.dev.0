Return-Path: <ksummit+bounces-466-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EE93D56F6
	for <lists@lfdr.de>; Mon, 26 Jul 2021 12:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 4F46F3E0F29
	for <lists@lfdr.de>; Mon, 26 Jul 2021 10:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B122FB2;
	Mon, 26 Jul 2021 10:03:54 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AF972
	for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 10:03:52 +0000 (UTC)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AkQtmxKrV9fe/8ONIGMxGBL0aV5oseYIsimQD?=
 =?us-ascii?q?101hICG9E/bo8/xG885x6faZslwssTQb+OxoW5PwJE80l6QU3WB5B97LYOClgh?=
 =?us-ascii?q?rKEGgI1+XfKlPbdxEWutQtt5tIQuxOTOf9ClV3lq/BjTWQGdxI+ra6zJw=3D?=
X-IronPort-AV: E=Sophos;i="5.84,270,1620684000"; 
   d="scan'208";a="388983648"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Jul 2021 12:03:49 +0200
Date: Mon, 26 Jul 2021 12:03:49 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Hannes Reinecke <hare@suse.de>
cc: Julia Lawall <julia.lawall@inria.fr>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, 
    NeilBrown <neilb@suse.de>, 
    Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
    Dan Carpenter <dan.carpenter@oracle.com>, ksummit@lists.linux.dev
Subject: Re: Potential static analysis ideas
In-Reply-To: <45ed0e03-2eb8-8ed8-898b-4f5f4d31a4a1@suse.de>
Message-ID: <alpine.DEB.2.22.394.2107261137200.6460@hadrien>
References: <20210723191023.GG25548@kadam> <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com> <YPyf4NkpONFhrbuw@pendragon.ideasonboard.com> <162717033769.3676.6942299974175827854@noble.neil.brown.name> <CAK8P3a2nm0fTf9-_sy9RTEaQv0yRqPHv_v+ZMX1yU=Pqj7idzw@mail.gmail.com>
 <CAMuHMdWL7bKUN1i1eDAi4Abc-jy3FjhO-CrsuAfN7cffQX2aHA@mail.gmail.com> <CAK8P3a27+pefDA7HC9u0k6Q=C8=8dEqpLik04--4pii-qX3VLQ@mail.gmail.com> <alpine.DEB.2.22.394.2107261025120.5982@hadrien> <633614dd-dd88-03f0-c463-d97036c58216@suse.de>
 <CAMuHMdUi6+9_TWNqk5=sebpzwbC0HHRzN5AHjySQgUCvmih9Tg@mail.gmail.com> <alpine.DEB.2.22.394.2107261125380.6460@hadrien> <45ed0e03-2eb8-8ed8-898b-4f5f4d31a4a1@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-936271841-1627293830=:6460"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-936271841-1627293830=:6460
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Mon, 26 Jul 2021, Hannes Reinecke wrote:

> On 7/26/21 11:28 AM, Julia Lawall wrote:
> > > > > Also, over 230 files contain functions that return both NULL and
> > > > > ERR_PTR.
> > > > > A random example, chosen for conciseness, is the following from
> > > > > fs/overlayfs/inode.c:
> > > > >
> > > > > struct inode *ovl_lookup_inode(struct super_block *sb, struct dentry
> > > > > *real,
> > > > >                                  bool is_upper)
> > > > > {
> > > > >        struct inode *inode, *key = d_inode(real);
> > > > >
> > > > >           inode = ilookup5(sb, (unsigned long) key, ovl_inode_test,
> > > > > key);
> > > > >        if (!inode)
> > > > >                   return NULL;
> > > > >
> > > > >           if (!ovl_verify_inode(inode, is_upper ? NULL : real,
> > > > >                                 is_upper ? real : NULL, false)) {
> > > > >                   iput(inode);
> > > > >                   return ERR_PTR(-ESTALE);
> > > > >           }
> > > > >
> > > > >           return inode;
> > > > > }
> > > > >
> > > > And that I would consider a coding error.
> > > > If a function is able to return an error pointer it should _always_
> > > > return an error pointer; here it would be trivial to return -ENXIO
> > > > instead of NULL in the first condition.
> > > >
> > > > Not doing so is just sloppy programming IMO.
> > >
> > > In this case I agree.
> >
> > I looked at the calling context, and it is not so obvious.  There are
> > different behaviors in the two cases at both callsites.  It is like what
> > Dan describes.  If the thing is not available, we just move on.  If it is
> > available some action is needed.  If there is an actual error, some error
> > handling is needed.
> >
> But isn't 'not available' an error, too?

No, it doesn't seem to be.

> And isn't that exactly why we have individual errnos?
>
> Why do we have to introduce different classes of errors (errno, NULL pointer),
> when we could have used a simple errno lik -ENXIO?
> And, of course, documentation for that function outlining what exactly the
> meaning of the individual error numbers is.
> But then we would need that anyway to clarify how the caller should interpret
> a 'NULL' return value.
>
> So: not convinced :-)

OK, I basically agree.  The point is just that there are going to be two
tests at both call sites either way.

julia

> Cheers,
>
> Hannes
> --
> Dr. Hannes Reinecke                Kernel Storage Architect
> hare@suse.de                              +49 911 74053 688
> SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
> HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer
>
--8323329-936271841-1627293830=:6460--

