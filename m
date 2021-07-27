Return-Path: <ksummit+bounces-476-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4E53D7A86
	for <lists@lfdr.de>; Tue, 27 Jul 2021 18:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 5B6761C09F2
	for <lists@lfdr.de>; Tue, 27 Jul 2021 16:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B172F80;
	Tue, 27 Jul 2021 16:06:38 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E18570
	for <ksummit@lists.linux.dev>; Tue, 27 Jul 2021 16:06:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4883E61AE1;
	Tue, 27 Jul 2021 16:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627401997;
	bh=licP0Fn1IPCLSnx3sqD9cMWxVGRFfpjKynVdnymH+ks=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=brKLsaxgi3nkJKDNLW/fTw6UfdZrJdhKnKOw/n4OfpprgHOeESSR0UInjt/ZqgFTR
	 tvCSK1fuXBxqYvCvPL106R37iNFtyNDcLqsNwGD0nM0iY2I3B/CEUCHJEZctwJxUJf
	 QXiRpEta6ieWZBP+9shGH0UR6RHJile7QH/SR9WAfFCQppON90NfiT7Djij8qazEj1
	 WHloXZknpkvucIep7+h5BuEXZ5kO2EAEoVasFH+D13n4bq8vt1V1P8/FUY31SbZqmd
	 bzMzcnUBHmjr8X5NZg73CkKIt10MJ3pMwghbS/X5gg02Ddvz6DzWPBbYclIUOU4c2O
	 rqbL4C4WymMcA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 151A45C099F; Tue, 27 Jul 2021 09:06:37 -0700 (PDT)
Date: Tue, 27 Jul 2021 09:06:37 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: ksummit@lists.linux.dev, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: Potential static analysis ideas
Message-ID: <20210727160637.GW4397@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20210723191023.GG25548@kadam>
 <20210726155039.GR4397@paulmck-ThinkPad-P17-Gen-1>
 <20210727093808.GO25548@kadam>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727093808.GO25548@kadam>

On Tue, Jul 27, 2021 at 12:38:08PM +0300, Dan Carpenter wrote:
> On Mon, Jul 26, 2021 at 08:50:39AM -0700, Paul E. McKenney wrote:
> > On Fri, Jul 23, 2021 at 10:10:23PM +0300, Dan Carpenter wrote:
> > > Rust has many good static analysis features but if we wanted we could
> > > implement a number of stricter rules in C.  With Smatch I have tried to
> > > focus on exclusively on finding bugs because everyone can agree that
> > > bugs are bad.  But if some subsystems wanted to implement stricter rules
> > > just as a hardenning measure then that's a doable thing.
> > > 
> > > For example, I've tried a bunch of approaches to warning about when the
> > > user can trigger an integer overflow.  The challenge is that most
> > > integer overflows are harmless and do not cause a real life bug.
> > 
> > I would not want overflow checks for unsigned integers, but it might
> > be helpful for signed integers.  But yes, most of us rely on fwrapv,
> > so that kernelwide checks for signed integer overflow will be quite noisy.
> 
> Since we use -fwrapv then even signed integer overflows are defined and
> I haven't seen a way that checking for signed integer overflows can be
> useful.

Just because the compiler defines something does not mean that it cannot
be involved in a bug.  ;-)

> With integer overflows I'm more talking about integer overflows from the
> user.  And I imagine a subsystem specific thing as a kind of "We want
> extra security but aren't ready to port everything to Rust" type option.

Which was what I was also imagining, but along different lines.

But I agree that what you are proposing might be useful.

							Thanx, Paul

> I have almost 2 thousand of these warnings.  This first example is from
> the ioctl and probably root only.  Plus commit 6d13de1489b6 ("uaccess:
> disallow > INT_MAX copy sizes") really improved security.
> 
> drivers/fpga/dfl-fme-pr.c
>     83          if (copy_from_user(&port_pr, argp, minsz))
>     84                  return -EFAULT;
>     85  
>     86          if (port_pr.argsz < minsz || port_pr.flags)
>     87                  return -EINVAL;
>     88  
>     89          /* get fme header region */
>     90          fme_hdr = dfl_get_feature_ioaddr_by_id(&pdev->dev,
>     91                                                 FME_FEATURE_ID_HEADER);
>     92  
>     93          /* check port id */
>     94          v = readq(fme_hdr + FME_HDR_CAP);
>     95          if (port_pr.port_id >= FIELD_GET(FME_CAP_NUM_PORTS, v)) {
>     96                  dev_dbg(&pdev->dev, "port number more than maximum\n");
>     97                  return -EINVAL;
>     98          }
>     99  
>    100          /*
>    101           * align PR buffer per PR bandwidth, as HW ignores the extra padding
>    102           * data automatically.
>    103           */
>    104          length = ALIGN(port_pr.buffer_size, 4);
>                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> This ALIGN() operation can overflow but only to zero.
> 
>    105  
>    106          buf = vmalloc(length);
> 
> kmalloc(() allows zero size allocations but vmalloc() will return NULL.
> And actually, in April, Nicholas Piggin made it trigger a WARN_ONCE().
> 
>    107          if (!buf)
>    108                  return -ENOMEM;
>    109  
>    110          if (copy_from_user(buf,
>    111                             (void __user *)(unsigned long)port_pr.buffer_address,
>    112                             port_pr.buffer_size)) {
>                                    ^^^^^^^^^^^^^^^^^^^
> So this can't corrupt memory for the reasons given above.
> 
> (It's still buggy because it doesn't zero out the last three bytes
> between port_pr.buffer_size and length, but that's a different issue).
> 
> regards,
> dan carpenter

