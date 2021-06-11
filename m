Return-Path: <ksummit+bounces-194-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D8E3A3F86
	for <lists@lfdr.de>; Fri, 11 Jun 2021 11:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id C90981C0E2C
	for <lists@lfdr.de>; Fri, 11 Jun 2021 09:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1A92FBF;
	Fri, 11 Jun 2021 09:52:34 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from 1wt.eu (wtarreau.pck.nerim.net [62.212.114.60])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B749272
	for <ksummit@lists.linux.dev>; Fri, 11 Jun 2021 09:52:32 +0000 (UTC)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 15B9pm8p026247;
	Fri, 11 Jun 2021 11:51:48 +0200
Date: Fri, 11 Jun 2021 11:51:48 +0200
From: Willy Tarreau <w@1wt.eu>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        David Hildenbrand <david@redhat.com>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Greg KH <greg@kroah.com>, Christoph Lameter <cl@gentwo.de>,
        "Theodore Ts'o" <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>,
        ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, netdev@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-api@vger.kernel.org
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
Message-ID: <20210611095148.GC25968@1wt.eu>
References: <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
 <b32c8672-06ee-bf68-7963-10aeabc0596c@redhat.com>
 <5038827c-463f-232d-4dec-da56c71089bd@metux.net>
 <20210610182318.jrxe3avfhkqq7xqn@nitro.local>
 <YMJcdbRaQYAgI9ER@pendragon.ideasonboard.com>
 <20210610152633.7e4a7304@oasis.local.home>
 <37e8d1a5-7c32-8e77-bb05-f851c87a1004@linuxfoundation.org>
 <87tum5uyrq.fsf@toke.dk>
 <20210611025942.GE25638@1wt.eu>
 <20210611111248.250e6da8@coco.lan>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210611111248.250e6da8@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Jun 11, 2021 at 11:13:07AM +0200, Mauro Carvalho Chehab wrote:
> > The only thing is that it can be quite intimidating for
> > local participants who are too shy of standing up in front of a
> > microphone and everyone else.
> 
> If someone is shy, he/she could simply type the question as a
> remote participant would do.

+1

> This should work fine for a normal speech, but for BoFs and the
> usual "round table" discussions we have at Kernel Maintainers,
> this may not work well for local participants.

Indeed but for this one the problem is the same with those who are
not much at ease with oral english. It's difficult to insert oneself
into a discussion flow between multiple people speaking fast and
naturally understanding what they're saying without having to think.
So this situation is not new, and actually this ability to interact
quickly is what makes such events profitable to a group, even if not
everyone can participate at the same level.

In such a case, it's the moderator's job to observe that some people
want to say something and probably need a second or two of silence and
concentration first. And this works both for local and remote ones.

Willy

