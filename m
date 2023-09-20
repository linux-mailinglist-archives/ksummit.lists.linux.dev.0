Return-Path: <ksummit+bounces-1181-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B41E7A8FA5
	for <lists@lfdr.de>; Thu, 21 Sep 2023 00:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68020B20B01
	for <lists@lfdr.de>; Wed, 20 Sep 2023 22:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56F33F4AB;
	Wed, 20 Sep 2023 22:54:39 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B49623CF
	for <ksummit@lists.linux.dev>; Wed, 20 Sep 2023 22:54:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A17E1257;
	Thu, 21 Sep 2023 00:52:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1695250372;
	bh=O/JNmMAvJeCqfqisQuU3QtfCBLPLvD5/r0/ilHrYjdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qgc+kS2rNXvwEPH1aUezvO9wxijF0pjKShHlrJNv37vliz5GnA+0/YGTNJgoQ5DDj
	 i3Lq9zop7Z1t3IvEQVu9gB9vGBI1tfNagMycMRilZ9Ah32MyRIZnHnfLLv1vA17DTq
	 pMepuCVeEoIYdHoCWQLfQYLTmSgcRh+mICOEDhoM=
Date: Thu, 21 Sep 2023 01:54:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Shuah <shuah@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Bart Van Assche <bvanassche@acm.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev,
	tech-board-discuss@lists.linux-foundation.org
Subject: Re: [MAINTAINERS SUMMIT] Maintainers Support Group
Message-ID: <20230920225441.GA12561@pendragon.ideasonboard.com>
References: <20230919121001.7bc610d4@gandalf.local.home>
 <dbeb5ad9-fa6d-4633-a160-6a0f8ed6bd51@acm.org>
 <20230919132112.19b700df@gandalf.local.home>
 <496f0b46-1a40-af25-ac1a-d4e7f1a8aad0@kernel.org>
 <20230919192148.1010cc74@gandalf.local.home>
 <57b53325-3c40-641e-30de-5755650960f8@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <57b53325-3c40-641e-30de-5755650960f8@kernel.org>

On Wed, Sep 20, 2023 at 01:52:19PM -0600, Shuah wrote:
> On 9/19/23 17:21, Steven Rostedt wrote:
> > On Tue, 19 Sep 2023 16:55:29 -0600 Shuah wrote:
> > 
> >> As I replied to Ted and Randy, I think the proposal James pointed to is
> >> where we could start and evolve that discussion to the actions such as
> >> support group, instead of starting with a solution without looking at
> >> the bigger picture.
> >>
> >> https://lore.kernel.org/ksummit/ab9cfd857e32635f626a906410ad95877a22f0db.camel@HansenPartnership.com/
> > 
> > I saw this when James first posted it. I may have been the lone figure to
> > do so as I had to point it out when the topic came up a second time ;-)
> > 
> >    https://lore.kernel.org/all/20230817104622.511c61b4@gandalf.local.home/
> > 
> > I'm all for having this discussion under James topic, but this idea of a
> > Support Group is something I've been discussing with other maintainers for
> > some time. I believe I even mentioned it to you while on the bus in Dublin.
>
> Thank you. Yes. We talked about this last year at Dublin. Work of being an
> Open source developer and especially a maintainer demands emotional labor.
> This is definitely a risk factor for burnout.
> 
> I happened to com across an article today about burnout risk factors and some
> of those are faced by maintainers and developers. If you are interested, I can
> send the link.

Collecting interesting (and hopefully useful) resources is a fairly low
effort exercise, so I'll start:

"Negotiating the Nonnegotiable", by Daniel Shapiro
https://www.penguinrandomhouse.com/books/314284/negotiating-the-nonnegotiable-by-daniel-shapiro/

The hard part will be finding time to read all the useful resources.

> > One of the things the TAB is working on is to come up with a "Communication
> > Style" document that will be focused on how submitters should speak to
> > maintainers and how maintainers should speak to submitters. The idea is to
> > help people understand the POV that others are coming from. But that's a
> > discussion for another day.
> 
> Formalizing the communication is a good idea - I keep translating maintainer
> and developer speak to new developers I mentor often enough to see the value
> of such an effort. :)
> 
> > Anyway, with the majority of the [MAINTAINERS SUMMIT] submissions related
> > to this, I think it should definitely be discussed at the maintainers
> > summit.
> 
> I would recommend discussion this prior to the Maintainer summit in an open
> session to get input from developers and maintainers who aren't invited to
> the maintainers summit myself included.

I wonder if I'm stating the obvious, but trying to figure out ways to
handle psychological problems in a group made of software developers
seems like we will be fairly short on essential skills for this kind of
exercise. Given the size of the affected community, I think we could
find ways to get professional help.

-- 
Regards,

Laurent Pinchart

