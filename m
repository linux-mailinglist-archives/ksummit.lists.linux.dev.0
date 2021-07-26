Return-Path: <ksummit+bounces-468-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 1475B3D6618
	for <lists@lfdr.de>; Mon, 26 Jul 2021 19:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id CAF233E0F2A
	for <lists@lfdr.de>; Mon, 26 Jul 2021 17:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3AF2FB8;
	Mon, 26 Jul 2021 17:55:02 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8062FB0
	for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 17:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 689341280F53;
	Mon, 26 Jul 2021 10:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1627322100;
	bh=XURXK+F6xGyhPZjvbybjqviqi7cGQjwlWg3skWnq2E8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=pmfRC8MMeJKRRYQmaArpg4pP6kv18TJA/HSA1F2Uezk+y1k/l/fLBUptQAQfQzxxc
	 m1r/+DcGU9Zbg1cksMRACthjgPL9/cce41Al+gbreHV0lOH7ib7iBiRMOE1i4w/ZPI
	 +xmwrQQyD7juRaZFzl7nDVjYyFGPpyPLqTeg4qYc=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8sVE_K9xjeZK; Mon, 26 Jul 2021 10:55:00 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id D971A1280F51;
	Mon, 26 Jul 2021 10:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1627322100;
	bh=XURXK+F6xGyhPZjvbybjqviqi7cGQjwlWg3skWnq2E8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=pmfRC8MMeJKRRYQmaArpg4pP6kv18TJA/HSA1F2Uezk+y1k/l/fLBUptQAQfQzxxc
	 m1r/+DcGU9Zbg1cksMRACthjgPL9/cce41Al+gbreHV0lOH7ib7iBiRMOE1i4w/ZPI
	 +xmwrQQyD7juRaZFzl7nDVjYyFGPpyPLqTeg4qYc=
Message-ID: <8ca1815230074c5ae31ec401ff533c0bf4baed92.camel@HansenPartnership.com>
Subject: Re: Potential static analysis ideas
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Hannes Reinecke <hare@suse.de>
Cc: Julia Lawall <julia.lawall@inria.fr>, Arnd Bergmann <arnd@arndb.de>, 
 NeilBrown <neilb@suse.de>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Dan Carpenter
 <dan.carpenter@oracle.com>, ksummit@lists.linux.dev
Date: Mon, 26 Jul 2021 10:54:59 -0700
In-Reply-To: <CAMuHMdUi6+9_TWNqk5=sebpzwbC0HHRzN5AHjySQgUCvmih9Tg@mail.gmail.com>
References: <20210723191023.GG25548@kadam>
	 <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>
	 <YPyf4NkpONFhrbuw@pendragon.ideasonboard.com>
	 <162717033769.3676.6942299974175827854@noble.neil.brown.name>
	 <CAK8P3a2nm0fTf9-_sy9RTEaQv0yRqPHv_v+ZMX1yU=Pqj7idzw@mail.gmail.com>
	 <CAMuHMdWL7bKUN1i1eDAi4Abc-jy3FjhO-CrsuAfN7cffQX2aHA@mail.gmail.com>
	 <CAK8P3a27+pefDA7HC9u0k6Q=C8=8dEqpLik04--4pii-qX3VLQ@mail.gmail.com>
	 <alpine.DEB.2.22.394.2107261025120.5982@hadrien>
	 <633614dd-dd88-03f0-c463-d97036c58216@suse.de>
	 <CAMuHMdUi6+9_TWNqk5=sebpzwbC0HHRzN5AHjySQgUCvmih9Tg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Mon, 2021-07-26 at 11:16 +0200, Geert Uytterhoeven wrote:
> Hi Hannes,
> 
> On Mon, Jul 26, 2021 at 11:08 AM Hannes Reinecke <hare@suse.de>
> wrote:
> > On 7/26/21 10:55 AM, Julia Lawall wrote:
> > > On Mon, 26 Jul 2021, Arnd Bergmann wrote:
> > > > On Mon, Jul 26, 2021 at 9:53 AM Geert Uytterhoeven <
> > > > geert@linux-m68k.org> wrote:
> > > > > On Mon, Jul 26, 2021 at 9:26 AM Arnd Bergmann <arnd@arndb.de>
> > > > > wrote:
> > > > > > On Sun, Jul 25, 2021 at 1:45 AM NeilBrown <neilb@suse.de>
> > > > > > wrote:
> > > > > > > On Sun, 25 Jul 2021, Laurent Pinchart wrote:
> > > > > > > > > To make it work well, you need to know if frob()
> > > > > > > > > and/or the current
> > > > > > > > > function return an error code or not.  While you can
> > > > > > > > > use some heuristics
> > > > > > > > > (e.g. is there any return -Exxx), perhaps we can add
> > > > > > > > > an annotation to
> > > > > > > > > indicate if a function returns an error code, or an
> > > > > > > > > error pointer?
> > > > > > > > 
> > > > > > > > https://lore.kernel.org/linux-media/YNMvarFl%2FKU1pGCG@pendragon.ideasonboard.com/
> > > > > > > > 
> > > > > > > > I think it would be useful, if not for the tools, at
> > > > > > > > least for
> > > > > > > > developers.
> > > > > > > 
> > > > > > > Agreed.  I added some code to smatch so that I could
> > > > > > > annotate pointers to
> > > > > > > say if they are allowed to be NULL.  The implementation
> > > > > > > isn't perfect,
> > > > > > > but I love having that extra documentation about when I
> > > > > > > do or don't have
> > > > > > > to check for NULL.
> > > > > > 
> > > > > > I can think of four different annotations that limit what a
> > > > > > pointer return from
> > > > > > a function can be:
> > > > > > 
> > > > > > a) either a valid pointer or NULL, but never an error
> > > > > > pointer,
> > > > > > b) either a valid pointer or an error pointer, but not
> > > > > > NULL,
> > > > > > c) always a valid pointer, never NULL or an error,
> > > > > > d) always NULL, but callers are expected to check for error
> > > > > > pointers.
> > > > > 
> > > > > e) either a valid pointer, NULL, or an error pointer
> > > > > 
> > > > > The last pattern is seen with the various *get*_optional()
> > > > > functions.
> > > > 
> > > > I would always consider those the exact bug that I meant with
> > > > "because
> > > > everyone gets those wrong". I think the idea of the "optional"
> > > > functions is
> > > > that you have two implementations b) and d) and pick one of
> > > > them
> > > > at compile time. To the caller this means either an error
> > > > pointer or
> > > > success, but checking for NULL is a bug in the caller, while
> > > > conditionally
> > > > returning NULL or ERR_PTR() would be a bug in the interface.
> > > 
> > > I'm not sure to understand the "bug in the caller"
> > > part.  Couldn't there
> > > be two possible definitions of the called function, according to
> > > different
> > > configuration options, and a single caller that calls both?
> > > 
> > > Also, over 230 files contain functions that return both NULL and
> > > ERR_PTR.
> > > A random example, chosen for conciseness, is the following from
> > > fs/overlayfs/inode.c:
> > > 
> > > struct inode *ovl_lookup_inode(struct super_block *sb, struct
> > > dentry *real,
> > >                                 bool is_upper)
> > > {
> > >       struct inode *inode, *key = d_inode(real);
> > > 
> > >          inode = ilookup5(sb, (unsigned long) key,
> > > ovl_inode_test, key);
> > >       if (!inode)
> > >                  return NULL;
> > > 
> > >          if (!ovl_verify_inode(inode, is_upper ? NULL : real,
> > >                                is_upper ? real : NULL, false)) {
> > >                  iput(inode);
> > >                  return ERR_PTR(-ESTALE);
> > >          }
> > > 
> > >          return inode;
> > > }
> > > 
> > And that I would consider a coding error.
> > If a function is able to return an error pointer it should _always_
> > return an error pointer; here it would be trivial to return -ENXIO
> > instead of NULL in the first condition.
> > 
> > Not doing so is just sloppy programming IMO.
> 
> In this case I agree.

Actually, I don't think so ... we have NULL return all over the inode
and dentry code.  It's a legitimate return for "I couldn't find what
you asked for" or in the dentry case "I have no current entry".  The
error returns are usually an explicit "there was some problem during
the lookup".

James



