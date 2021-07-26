Return-Path: <ksummit+bounces-458-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id D69E93D55EE
	for <lists@lfdr.de>; Mon, 26 Jul 2021 10:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 0EC8D1C09AC
	for <lists@lfdr.de>; Mon, 26 Jul 2021 08:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D1E42FB2;
	Mon, 26 Jul 2021 08:55:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1AC72
	for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 08:55:39 +0000 (UTC)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A6eBasKME8ETZJcBcTyP355DYdb4zR+YMi2TD?=
 =?us-ascii?q?j3oBLiC8cqSj+PxG785rsyMc6QxhL03I9urwW5VoLUmwyXcx2/h0AV7AZniRhI?=
 =?us-ascii?q?LLFvAB0WKK+VSJcEfDH6xmpMJdmsNFZuEYeGIbsS+M2miF+rgbrOWvweSNv6Pz?=
 =?us-ascii?q?3n1tRQZlZ+VL9AFiED+BHkl3XgVdQbIkCZu1/KN81nmdUEVSSv7+KmgOXuDFqd?=
 =?us-ascii?q?GOvonhewQ+HBIi6BODl3eB9KP6NxST3x8YUylKqI1Ss1Ttokjc3OGOovu7whjT?=
 =?us-ascii?q?2yv49JJNguL7xt9CHsCXzuAINzTXjBqybogJYczGgBkF5MWUrHo6mtjFpBkte+?=
 =?us-ascii?q?5p7WnKR3q4pRv21xOl+xwFgkWSkGOwsD/Gm4jUVTg6A81OicZyaR3C8XM6sNV9?=
 =?us-ascii?q?yq5Qm1iykvNsfFT9tRW4w+KNewBhl0Kyr3Znu/UUlWZnSocbaKVct8gj50tTCo?=
 =?us-ascii?q?4HBz/G84gpH+llMdHE6J9tABenRkGcmlMq7M2nX3w1EBvDaFMFoNatyDRTnGp0?=
 =?us-ascii?q?1Q8Rw9EehG4J8NYmQZFC7eLCL6h4idh1P5UrRJM4IN1Ebdq8C2TLTx6JGnmVO0?=
 =?us-ascii?q?7fD60CO2jAsdry7K8u7O+nYpoV15E/8a6xFm9whCoXQQbDGMeO1JpE/lTmW2Om?=
 =?us-ascii?q?Rw33xsVf/ZRi/rvmRLTqNiWHQlUvn8y8o+wWD8DBV+yoUagmW8PLHC/LI8Jkzg?=
 =?us-ascii?q?f+U55dJT01S8sOoO8hV1aPuM7QbpTwsObWauzeKf7nAXImXH/lBXMHXD/8Tf8w?=
 =?us-ascii?q?s3yDazvdulz8Snntckvw8dZbC67B5dEJxIwMLIFX9hUPgVOi/8eRNCBYuqM4fE?=
 =?us-ascii?q?FiMKrq+5nL/lWezCLt1SFEKxBdBkFa7PHLSHVRvzIHNEvybPIqp8ifUXo65grO?=
 =?us-ascii?q?GjZPC+ftVCJPrVV+/qy6a7aKwzo5Nt6hOmWGy1MOuXOxSYsGkKHr37avRnp4NO?=
 =?us-ascii?q?dtZEVCL3SGK/VHo3cklI6FUn5LeqbrLEKitUxitu1UOAiQTag9vO7hG78slZuW?=
 =?us-ascii?q?jzTlmSiEfApGY9fpa7/fve9mfUsuunRht6AYm7aOgjCpNC82h/k5KkRFbCCNDK?=
 =?us-ascii?q?tBFxntXvQmpllFQnAOcY6mv03qt/gIQBuby2wCwmj6aSGEc/DCBVRQ/nhez6bx?=
 =?us-ascii?q?6VtxMmGQZVh5ZHx2uZB0UT2ugAcH7cabIq6ol2eBYFoLxe8QdDnDfDsJOwtrg9?=
 =?us-ascii?q?S6zgScljqOHWgvgp8uIuveBrI+dKy74ALeFGSsr9BzIxZ5xucZCDneiJ50bQvE?=
 =?us-ascii?q?QX7uENrRMZJU5zCo?=
X-IronPort-AV: E=Sophos;i="5.84,270,1620684000"; 
   d="scan'208";a="388975861"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Jul 2021 10:55:31 +0200
Date: Mon, 26 Jul 2021 10:55:31 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Arnd Bergmann <arnd@arndb.de>
cc: Geert Uytterhoeven <geert@linux-m68k.org>, NeilBrown <neilb@suse.de>, 
    Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
    Dan Carpenter <dan.carpenter@oracle.com>, ksummit@lists.linux.dev
Subject: Re: Potential static analysis ideas
In-Reply-To: <CAK8P3a27+pefDA7HC9u0k6Q=C8=8dEqpLik04--4pii-qX3VLQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2107261025120.5982@hadrien>
References: <20210723191023.GG25548@kadam> <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com> <YPyf4NkpONFhrbuw@pendragon.ideasonboard.com> <162717033769.3676.6942299974175827854@noble.neil.brown.name> <CAK8P3a2nm0fTf9-_sy9RTEaQv0yRqPHv_v+ZMX1yU=Pqj7idzw@mail.gmail.com>
 <CAMuHMdWL7bKUN1i1eDAi4Abc-jy3FjhO-CrsuAfN7cffQX2aHA@mail.gmail.com> <CAK8P3a27+pefDA7HC9u0k6Q=C8=8dEqpLik04--4pii-qX3VLQ@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 26 Jul 2021, Arnd Bergmann wrote:

> On Mon, Jul 26, 2021 at 9:53 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Mon, Jul 26, 2021 at 9:26 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Sun, Jul 25, 2021 at 1:45 AM NeilBrown <neilb@suse.de> wrote:
> > > > On Sun, 25 Jul 2021, Laurent Pinchart wrote:
> > > > > > To make it work well, you need to know if frob() and/or the current
> > > > > > function return an error code or not.  While you can use some heuristics
> > > > > > (e.g. is there any return -Exxx), perhaps we can add an annotation to
> > > > > > indicate if a function returns an error code, or an error pointer?
> > > > >
> > > > > https://lore.kernel.org/linux-media/YNMvarFl%2FKU1pGCG@pendragon.ideasonboard.com/
> > > > >
> > > > > I think it would be useful, if not for the tools, at least for
> > > > > developers.
> > > >
> > > > Agreed.  I added some code to smatch so that I could annotate pointers to
> > > > say if they are allowed to be NULL.  The implementation isn't perfect,
> > > > but I love having that extra documentation about when I do or don't have
> > > > to check for NULL.
> > >
> > > I can think of four different annotations that limit what a pointer return from
> > > a function can be:
> > >
> > > a) either a valid pointer or NULL, but never an error pointer,
> > > b) either a valid pointer or an error pointer, but not NULL,
> > > c) always a valid pointer, never NULL or an error,
> > > d) always NULL, but callers are expected to check for error pointers.
> >
> > e) either a valid pointer, NULL, or an error pointer
> >
> > The last pattern is seen with the various *get*_optional() functions.
>
> I would always consider those the exact bug that I meant with "because
> everyone gets those wrong". I think the idea of the "optional" functions is
> that you have two implementations b) and d) and pick one of them
> at compile time. To the caller this means either an error pointer or
> success, but checking for NULL is a bug in the caller, while conditionally
> returning NULL or ERR_PTR() would be a bug in the interface.

I'm not sure to understand the "bug in the caller" part.  Couldn't there
be two possible definitions of the called function, according to different
configuration options, and a single caller that calls both?

Also, over 230 files contain functions that return both NULL and ERR_PTR.
A random example, chosen for conciseness, is the following from
fs/overlayfs/inode.c:

struct inode *ovl_lookup_inode(struct super_block *sb, struct dentry *real,
                               bool is_upper)
{
 	struct inode *inode, *key = d_inode(real);

        inode = ilookup5(sb, (unsigned long) key, ovl_inode_test, key);
	if (!inode)
                return NULL;

        if (!ovl_verify_inode(inode, is_upper ? NULL : real,
                              is_upper ? real : NULL, false)) {
                iput(inode);
                return ERR_PTR(-ESTALE);
        }

        return inode;
}

julia

