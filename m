Return-Path: <ksummit+bounces-470-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2049F3D66C9
	for <lists@lfdr.de>; Mon, 26 Jul 2021 20:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 37D271C09A8
	for <lists@lfdr.de>; Mon, 26 Jul 2021 18:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D392FB2;
	Mon, 26 Jul 2021 18:31:38 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15A470
	for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 18:31:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 568B1501;
	Mon, 26 Jul 2021 20:31:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1627324288;
	bh=ohpNA4A7TvQ8sgrN1Y1mHSIMVlKc4jBj4ym4a2UPAg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UmHZTqVFN8aP/V2bkFXKEVog5m/dsfv/LY3IHHR3Y/RF+wk+5qcExRB7K+gv2jvz3
	 1kA55oeKa8aQzLfPkfxssevvBAKsVonpihZ3bHaVeGpo5kFg+IGWZCCB+w414V5Bgu
	 4SUE0RkoP8JDc6YFQQTI+lQIjc/yIqABcDBHeIcw=
Date: Mon, 26 Jul 2021 21:31:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Hannes Reinecke <hare@suse.de>,
	Julia Lawall <julia.lawall@inria.fr>, Arnd Bergmann <arnd@arndb.de>,
	NeilBrown <neilb@suse.de>, Dan Carpenter <dan.carpenter@oracle.com>,
	ksummit@lists.linux.dev
Subject: Re: Potential static analysis ideas
Message-ID: <YP7/eyqDcJR3L8V9@pendragon.ideasonboard.com>
References: <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>
 <YPyf4NkpONFhrbuw@pendragon.ideasonboard.com>
 <162717033769.3676.6942299974175827854@noble.neil.brown.name>
 <CAK8P3a2nm0fTf9-_sy9RTEaQv0yRqPHv_v+ZMX1yU=Pqj7idzw@mail.gmail.com>
 <CAMuHMdWL7bKUN1i1eDAi4Abc-jy3FjhO-CrsuAfN7cffQX2aHA@mail.gmail.com>
 <CAK8P3a27+pefDA7HC9u0k6Q=C8=8dEqpLik04--4pii-qX3VLQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2107261025120.5982@hadrien>
 <633614dd-dd88-03f0-c463-d97036c58216@suse.de>
 <CAMuHMdUi6+9_TWNqk5=sebpzwbC0HHRzN5AHjySQgUCvmih9Tg@mail.gmail.com>
 <8ca1815230074c5ae31ec401ff533c0bf4baed92.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8ca1815230074c5ae31ec401ff533c0bf4baed92.camel@HansenPartnership.com>

Hi James,

On Mon, Jul 26, 2021 at 10:54:59AM -0700, James Bottomley wrote:
> On Mon, 2021-07-26 at 11:16 +0200, Geert Uytterhoeven wrote:
> > On Mon, Jul 26, 2021 at 11:08 AM Hannes Reinecke wrote:
> > > On 7/26/21 10:55 AM, Julia Lawall wrote:
> > > > On Mon, 26 Jul 2021, Arnd Bergmann wrote:
> > > > > On Mon, Jul 26, 2021 at 9:53 AM Geert Uytterhoeven wrote:
> > > > > > On Mon, Jul 26, 2021 at 9:26 AM Arnd Bergmann wrote:
> > > > > > > On Sun, Jul 25, 2021 at 1:45 AM NeilBrown wrote:
> > > > > > > > On Sun, 25 Jul 2021, Laurent Pinchart wrote:
> > > > > > > > > > To make it work well, you need to know if frob() and/or the current
> > > > > > > > > > function return an error code or not.  While you can use some heuristics
> > > > > > > > > > (e.g. is there any return -Exxx), perhaps we can add an annotation to
> > > > > > > > > > indicate if a function returns an error code, or an error pointer?
> > > > > > > > > 
> > > > > > > > > https://lore.kernel.org/linux-media/YNMvarFl%2FKU1pGCG@pendragon.ideasonboard.com/
> > > > > > > > > 
> > > > > > > > > I think it would be useful, if not for the tools, at least for
> > > > > > > > > developers.
> > > > > > > > 
> > > > > > > > Agreed.  I added some code to smatch so that I could annotate pointers to
> > > > > > > > say if they are allowed to be NULL.  The implementation isn't perfect,
> > > > > > > > but I love having that extra documentation about when I do or don't have
> > > > > > > > to check for NULL.
> > > > > > > 
> > > > > > > I can think of four different annotations that limit what a pointer return from
> > > > > > > a function can be:
> > > > > > > 
> > > > > > > a) either a valid pointer or NULL, but never an error pointer,
> > > > > > > b) either a valid pointer or an error pointer, but not NULL,
> > > > > > > c) always a valid pointer, never NULL or an error,
> > > > > > > d) always NULL, but callers are expected to check for error
> > > > > > > pointers.
> > > > > > 
> > > > > > e) either a valid pointer, NULL, or an error pointer
> > > > > > 
> > > > > > The last pattern is seen with the various *get*_optional()
> > > > > > functions.
> > > > > 
> > > > > I would always consider those the exact bug that I meant with "because
> > > > > everyone gets those wrong". I think the idea of the "optional" functions is
> > > > > that you have two implementations b) and d) and pick one of them
> > > > > at compile time. To the caller this means either an error pointer or
> > > > > success, but checking for NULL is a bug in the caller, while conditionally
> > > > > returning NULL or ERR_PTR() would be a bug in the interface.
> > > > 
> > > > I'm not sure to understand the "bug in the caller" part.  Couldn't there
> > > > be two possible definitions of the called function, according to different
> > > > configuration options, and a single caller that calls both?
> > > > 
> > > > Also, over 230 files contain functions that return both NULL and ERR_PTR.
> > > > A random example, chosen for conciseness, is the following from
> > > > fs/overlayfs/inode.c:
> > > > 
> > > > struct inode *ovl_lookup_inode(struct super_block *sb, struct dentry *real,
> > > >                                 bool is_upper)
> > > > {
> > > >       struct inode *inode, *key = d_inode(real);
> > > > 
> > > >          inode = ilookup5(sb, (unsigned long) key, ovl_inode_test, key);
> > > >       if (!inode)
> > > >                  return NULL;
> > > > 
> > > >          if (!ovl_verify_inode(inode, is_upper ? NULL : real,
> > > >                                is_upper ? real : NULL, false)) {
> > > >                  iput(inode);
> > > >                  return ERR_PTR(-ESTALE);
> > > >          }
> > > > 
> > > >          return inode;
> > > > }
> > > > 
> > > And that I would consider a coding error.
> > > If a function is able to return an error pointer it should _always_
> > > return an error pointer; here it would be trivial to return -ENXIO
> > > instead of NULL in the first condition.
> > > 
> > > Not doing so is just sloppy programming IMO.
> > 
> > In this case I agree.
> 
> Actually, I don't think so ... we have NULL return all over the inode
> and dentry code.  It's a legitimate return for "I couldn't find what
> you asked for" or in the dentry case "I have no current entry".  The
> error returns are usually an explicit "there was some problem during
> the lookup".

It's a matter of semantics. From a technical point of view, both NULL or
a particular error code can mean "not found". What has been bothering me
for a long time, and keeps doing so, is the lack of standardization in
the semantics. Even within a subsystem, different semantics can be used,
and that's the source of bugs and overall pain for developers. I'm not
sure if complete standardization at the kernel level is possible, but
any step we can take in that direction would I believe be an
improvement. At the very least, we need a way for developers to easily
figure out what semantics a given function uses. Having to read the
source code, sometimes diving deep in call stacks, to find if a function
can return NULL, is too painful.

-- 
Regards,

Laurent Pinchart

