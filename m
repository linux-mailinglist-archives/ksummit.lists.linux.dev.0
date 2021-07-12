Return-Path: <ksummit+bounces-383-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 540C13C5DDB
	for <lists@lfdr.de>; Mon, 12 Jul 2021 15:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 41C591C0E58
	for <lists@lfdr.de>; Mon, 12 Jul 2021 13:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455F22F80;
	Mon, 12 Jul 2021 13:58:43 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C235070
	for <ksummit@lists.linux.dev>; Mon, 12 Jul 2021 13:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626098320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gl79Dkn8BvS0qoOTpLktI9m5dyh33jrvac8vje0emCo=;
	b=QQvQAti2SGUUTKmNGAxR2cn3ZJI0vxCTG/WOkOVyA4Synw1EoDJc2JofZnet34AGzEQzQh
	Qu3A7szPu2BZtvF9gK0jY2Y+RYvk7C7dMqV+fC213jsSq10JAgwkgd4lVdtGK89Y3MAewh
	ATKxtgTqLLIS3tBH+hSESQ/Fxcc/TYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-_BkKE6phPhm0GPsGDSDtLA-1; Mon, 12 Jul 2021 09:58:39 -0400
X-MC-Unique: _BkKE6phPhm0GPsGDSDtLA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3779C362F8;
	Mon, 12 Jul 2021 13:58:38 +0000 (UTC)
Received: from redhat.com (ovpn-117-23.rdu2.redhat.com [10.10.117.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C124A60C9D;
	Mon, 12 Jul 2021 13:58:37 +0000 (UTC)
Date: Mon, 12 Jul 2021 09:58:35 -0400
From: Don Zickus <dzickus@redhat.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [Tech Topic] Integrating GitLab into the Red Hat kernel workflow
Message-ID: <20210712135835.qgh7u5f7p2oy7cp5@redhat.com>
References: <20210707211951.fyiflsp75i7spcha@redhat.com>
 <YOYf3c5UPMG4yBVP@pendragon.ideasonboard.com>
 <20210707222728.jocrxvqogwjd5ozx@redhat.com>
 <YOYtURGM6VDnOrH9@pendragon.ideasonboard.com>
 <20210708210436.apvu2isib67cmuee@redhat.com>
 <YOohaRa7OWO88Mub@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YOohaRa7OWO88Mub@pendragon.ideasonboard.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dzickus@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 11, 2021 at 01:38:33AM +0300, Laurent Pinchart wrote:
> Hi Don,
> 
> > Yes, we are still tweaking our workflow too, to find that balance for
> > collaboration between ease-of-use (email) and structured data (gitlab).
> 
> I'd put this slightly differently. E-mail doesn't bring ease of use by
> itself. What I really want to keep from the e-mail workflow is the
> following features.
> 
> - A single client where I can do all my review. With web-based UIs for
>   forges, you have to log in every forge for every project you work on.
>   That's one for github, one for gitlab, one for each self-hosted github
>   or gitlab instance (fd.o has a self-hosted public gitlab instance,
>   it's also common for large companies to have self-hosted private
>   instances), and I'm not counting gerrit instances or other forges.
>   It's painful, I want not only to get all the notifications in a single
>   client (that's already possible with e-mail notifications) but handle
>   review in a single client too.

The biggest hurdle for reviews I see is un-authenticated email sent to an
autenticated forge.  Currently we have an email-bridge bot that copies
comments from a trusted mailing list to the forge but it is clear that the
comment is using the authenticated bot.

Some forges use an embedded personal token in the reply-to field to work
around this.  But it restricts collaboration in my opinion.

But I agree with your perspective.

> 
> - The ability to easily extend and customize my workflow. With web-based
>   UIs, flexibility is very limited (there are APIs that allow developing
>   applications to perform customization, but that's a heavy process).
>   With e-mail clients, developers can pick their own clients and
>   customize the workflow as they want.

Internally for reviewers, there are two popular use-cases.  The traditional
collaboration about the patches as you suggested and the
what-patches-need-my-attention.  As RHEL is more backport heavy (leaving
technical collaboration for upstream), we have focused more on the latter
use case, hence our tooling effort.

The former use-case is still a concern and various developers are working on
ideas to make it easier.  Suggestions like yours are welcomed.

> 
> Furthermore, I don't think structured data needs to be limited to
> forges. Structured data can be transported over e-mail, or other
> transport protocols, what we're missing is clients that could interpret
> them correctly.

Ok.  Let's say I have a couple of developers that can tweak gitlab emails to
try new ideas.  I assume X-labels only go so far.  What other thoughts do
you have that we might play around with?

Cheers,
Don

> 
> > We even have a public-inbox prototype that connects with the GitLab API and
> > allows you to reply with some mutt hacking.  Not sure if that is a useful
> > direction for you.
> > 
> > But yes, internally, patch review has been our most discussed topic.
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 


