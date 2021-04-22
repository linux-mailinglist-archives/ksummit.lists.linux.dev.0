Return-Path: <ksummit+bounces-37-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A3C367A86
	for <lists@lfdr.de>; Thu, 22 Apr 2021 09:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id B7A921C3353
	for <lists@lfdr.de>; Thu, 22 Apr 2021 07:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230DB2FA1;
	Thu, 22 Apr 2021 07:05:36 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [142.44.231.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9565970
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 07:05:34 +0000 (UTC)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat Linux))
	id 1lZTOp-007FPy-TU; Thu, 22 Apr 2021 07:05:19 +0000
Date: Thu, 22 Apr 2021 07:05:19 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	Roland Dreier <roland@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIEgL6GHbWpGWReS@zeniv-ca.linux.org.uk>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210421152209.68075314@gandalf.local.home>
 <CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com>
 <20210422055948.GA4171859@infradead.org>
 <CA+Ln22HgpDk5=k7PhhVDdS5UZFZ7MMwTznXs-weqrmXzWYX8Cg@mail.gmail.com>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+Ln22HgpDk5=k7PhhVDdS5UZFZ7MMwTznXs-weqrmXzWYX8Cg@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Apr 22, 2021 at 03:28:25PM +0900, Tomasz Figa wrote:
> 2021年4月22日(木) 15:01 Christoph Hellwig <hch@infradead.org>:
> >
> > On Wed, Apr 21, 2021 at 12:32:33PM -0700, Roland Dreier wrote:
> > > I also think there does need to be a strong sanction against this UMN
> > > research group, since we need to make sure there are strong incentives
> > > against wasting everyone's time with stunts like this.  Hopefully on
> > > the academic side it can be made clear that this is not ethical
> > > research - for example, why did IEEE think this was an acceptable
> > > paper?
> >
> > I wholeheartedly disagree.  Demonstrating this kind of "attack" has
> > been long overdue, and kicked off a very important discussion.  Even
> > more so as in this area malice is almost indistinguishable from normal
> > incompetence.  I think they deserve a medel of honor.
> >
> 
> Agreed with Christoph. We are talking here about a critical piece of
> the software that is the foundation of security of the whole system.
> That we have a problem with the volume of reviews has been a topic on
> various conferences since years and my experience is that it hasn't
> really improved. As a part of my Chromium work, I often find upstream
> code with issues that make me really concerned about the quality of
> the review it received. Not saying it applies to all subsystems of
> course, but not limited to single special cases either.
> 
> That said, I think UMN should have done this in a more ethical way.
> For example, someone from the kernel community could have been
> involved as a supervisor, to prevent things from running out of
> control and ending up as real exploits and also to facilitate a
> clean-up after the experiment ends. Also the fact that they are
> denying this now is concerning.

Three words: list of SHA1.  Posted once their experiment had been finished.
AFAICS, they have *not* bothered to publish that, and when a paper mentions
raising awareness, you really want to see the raw data.  Cf. "framing",
"advocacy", "science by press conference", etc.

