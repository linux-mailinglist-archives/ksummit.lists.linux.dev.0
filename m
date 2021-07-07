Return-Path: <ksummit+bounces-319-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C838B3BF215
	for <lists@lfdr.de>; Thu,  8 Jul 2021 00:27:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id B79EE1C0DF6
	for <lists@lfdr.de>; Wed,  7 Jul 2021 22:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A03F2F80;
	Wed,  7 Jul 2021 22:27:36 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7300168
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 22:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625696853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C7QC1fHRuWkpZ9DA/0nbCXb+Qw0d0gJe+Y29saBUi14=;
	b=gQDb4grYaeOzBf74R3g80lnWtKz2CU+epNhl2GWsy+k8KjzBY7LCg9CJMoM++9Kokz1juA
	RfS3BRZ01oNefG9jytVQv9n2eu6X0pWWEdDP70PcFlmtdttlNE20RNcwldIVKTB37hZdBi
	TKTwcNBWA8eC4C+WltGmZsapdVIb7+w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-aDOoSGCrN3q275is67mTMw-1; Wed, 07 Jul 2021 18:27:32 -0400
X-MC-Unique: aDOoSGCrN3q275is67mTMw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7733100C610;
	Wed,  7 Jul 2021 22:27:30 +0000 (UTC)
Received: from redhat.com (ovpn-116-226.rdu2.redhat.com [10.10.116.226])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8977B19C45;
	Wed,  7 Jul 2021 22:27:30 +0000 (UTC)
Date: Wed, 7 Jul 2021 18:27:28 -0400
From: Don Zickus <dzickus@redhat.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [Tech Topic] Integrating GitLab into the Red Hat kernel workflow
Message-ID: <20210707222728.jocrxvqogwjd5ozx@redhat.com>
References: <20210707211951.fyiflsp75i7spcha@redhat.com>
 <YOYf3c5UPMG4yBVP@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YOYf3c5UPMG4yBVP@pendragon.ideasonboard.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dzickus@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 08, 2021 at 12:42:53AM +0300, Laurent Pinchart wrote:
> Hi Don,
> 
> On Wed, Jul 07, 2021 at 05:19:51PM -0400, Don Zickus wrote:
> > Submission #89:
> > 
> > The Red Hat kernel team recently converted their RHEL workflow from
> > PatchWork to GitLab. This talk will discuss what the new workflow looks like
> > with integrated CI and reduced emails. New tooling had to be created to
> > assist the developer and reviewer. Webhooks were utilized to autoamte as
> > much of the process as possible making it easy for a maintainer to track
> > progress of each submitted change. Finally using CKI, every submitted change
> > has to pass CI checks before it can be merged.
> > 
> > We faced many challenges especially around reviewing changes. Resolving
> > those led to a reduction of email usage and an increase in cli tools. Demos
> > of those tools will be included.
> 
> If gitlab is used in this context (I'm talking about reviews here, not
> CI) as a transport mechanism for structured data handled by CLI tools,
> what would prevent us from developing similar tools on top of less
> centralized and proprietary transport mechanism ?

Nothing I think.  It is just api calls around abstract pieces of a review
process.

If as a reviewer you want to see:
* all patches that touch files/directories X, Y, Z
* all discussions around those patches
* who has approved the patch
* who is blocking the patch
* has it passed CI
* other details

then the tool just calls whatever api to whatever tool to put all that
together and present it to you.  GitLab structured data in a way to allow us
to rethink things and we built a tool around this new approach.  I am sure
it can't be that hard to abstract further and extend it to other tools if
that is interesting.

Email workflow works great.  But as PatchWork showed us, there are some
extra details or tracking that is interesting to some folks.  With GitLab we
extend this a little further.

It really depends on what you want to see when you review a patch.

Thanks for the interest!

Cheers,
Don


