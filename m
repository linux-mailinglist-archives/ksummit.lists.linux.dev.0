Return-Path: <ksummit+bounces-359-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C3C3C1AD1
	for <lists@lfdr.de>; Thu,  8 Jul 2021 23:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id EE0CC3E10F0
	for <lists@lfdr.de>; Thu,  8 Jul 2021 21:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4E72F80;
	Thu,  8 Jul 2021 21:04:44 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840FA72
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 21:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625778281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=frJ3zW3fJpTwyKIOxcX3sOloT3YmM+uQiWseLwx6DpI=;
	b=Tr9bNfdyEo6GuzN8tfyR93WcKuroH192apMx1hqVv+DsudGDDo0r6vew7cKwDd4LJyWpAv
	5gLWyHZ8XxXfmwyAbhw0XpZWGUxqHgEn/RoV+eS/M9u0vjWijGrDCmBIPgwAqNe+MnyZGl
	hKSRz8CMcDHWCRra7Zp1P0S2GtUTx44=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-kP_JA42UMzCpUO4r0kMmTA-1; Thu, 08 Jul 2021 17:04:40 -0400
X-MC-Unique: kP_JA42UMzCpUO4r0kMmTA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCDB51005E4C;
	Thu,  8 Jul 2021 21:04:38 +0000 (UTC)
Received: from redhat.com (ovpn-116-226.rdu2.redhat.com [10.10.116.226])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 804AA5D9D3;
	Thu,  8 Jul 2021 21:04:38 +0000 (UTC)
Date: Thu, 8 Jul 2021 17:04:36 -0400
From: Don Zickus <dzickus@redhat.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: ksummit@lists.linux.dev
Subject: Re: [Tech Topic] Integrating GitLab into the Red Hat kernel workflow
Message-ID: <20210708210436.apvu2isib67cmuee@redhat.com>
References: <20210707211951.fyiflsp75i7spcha@redhat.com>
 <YOYf3c5UPMG4yBVP@pendragon.ideasonboard.com>
 <20210707222728.jocrxvqogwjd5ozx@redhat.com>
 <YOYtURGM6VDnOrH9@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YOYtURGM6VDnOrH9@pendragon.ideasonboard.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dzickus@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 08, 2021 at 01:40:17AM +0300, Laurent Pinchart wrote:
> > If as a reviewer you want to see:
> > * all patches that touch files/directories X, Y, Z
> > * all discussions around those patches
> > * who has approved the patch
> > * who is blocking the patch
> > * has it passed CI
> > * other details
> > 
> > then the tool just calls whatever api to whatever tool to put all that
> > together and present it to you.  GitLab structured data in a way to allow us
> > to rethink things and we built a tool around this new approach.  I am sure
> > it can't be that hard to abstract further and extend it to other tools if
> > that is interesting.
> 
> In that workflow, how does a reviewer enter review data ? Does it have
> to go through the gitlab web UI, or do you have alternate means through
> CLI tools and/or e-mail bridges ?

Currently we are using an email bridge as the tool stabilizes and GitLab
resolves some of the quirks we have identified.  But our email bridge stats
show very few developers are using email as most have migrated to the cli
tools.

> 
> One particular shortcoming of gitlab that I've noticed is that it
> doesn't seem to be possible to comment inline on a commit message. I
> don't know if it's a limitation of the UI only, or if the protocol and
> data formats also don't support that. Good commit messages are very
> important, and I believe a tool that doesn't let me comment on how to
> improve a commit message could cause the overall quality of the
> development to decrease over time. Have you noticed the same
> shortcoming, and if so, have you found ways to address it ?

Yes and we raised it with GitLab.  We will work with them to see if it is
possible to fix this year.

> 
> > Email workflow works great.  But as PatchWork showed us, there are some
> > extra details or tracking that is interesting to some folks.  With GitLab we
> > extend this a little further.
> > 
> > It really depends on what you want to see when you review a patch.
> 
> E-mail is very limited by itself when it comes to tracking information.
> Services like patchwork help there, but they're limited by the fact that
> data isn't structured. Services such as git..b have an advantage in that
> front. When it comes to doing the actual review, however, I believe the
> situation is the opposite. I'm dreaming of a way to move our e-mail
> workflow from unstructured to structured data in order to get the best
> of both worlds, with services that can then subscribe to the mailing
> lists (which are really transport mechanisms) to gather data and expose
> it in useful ways. I have high hopes that the work done by Konstantin
> and others will bring us in that direction.

Yes, we are still tweaking our workflow too, to find that balance for
collaboration between ease-of-use (email) and structured data (gitlab).

We even have a public-inbox prototype that connects with the GitLab API and
allows you to reply with some mutt hacking.  Not sure if that is a useful
direction for you.

But yes, internally, patch review has been our most discussed topic.

Cheers,
Don


