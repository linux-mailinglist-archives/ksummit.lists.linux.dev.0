Return-Path: <ksummit+bounces-386-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC403C88C1
	for <lists@lfdr.de>; Wed, 14 Jul 2021 18:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 785193E102C
	for <lists@lfdr.de>; Wed, 14 Jul 2021 16:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F022F80;
	Wed, 14 Jul 2021 16:35:17 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FBD72
	for <ksummit@lists.linux.dev>; Wed, 14 Jul 2021 16:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626280514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xvqErESctDD4RNr1OE8s0FwVZky4GghKRckObr71Fko=;
	b=MOIH+vwCf00cx6quQsgT4EKho5prXSg6oh1NZYBwLn0sz49BR0qs2S0v+ZUfNwdsJBkT9g
	I9cCAkRMw7rmXTqjge5R7MoIPt6AafAM5eiub5SgbLMs69CJTeV7+hZMiLtQ6Qn+klkjdI
	kvuo/coiTpw2h7HYDvvbX+PqPaCJqS4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-mP7SdeADMXKJl8E8TkRamA-1; Wed, 14 Jul 2021 12:35:10 -0400
X-MC-Unique: mP7SdeADMXKJl8E8TkRamA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 363FA10C1ADC;
	Wed, 14 Jul 2021 16:35:09 +0000 (UTC)
Received: from redhat.com (ovpn-117-23.rdu2.redhat.com [10.10.117.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F7975D6AB;
	Wed, 14 Jul 2021 16:35:08 +0000 (UTC)
Date: Wed, 14 Jul 2021 12:35:06 -0400
From: Don Zickus <dzickus@redhat.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	ksummit@lists.linux.dev
Subject: Re: [Tech Topic] Integrating GitLab into the Red Hat kernel workflow
Message-ID: <20210714163506.fo3xwjcrqg3vrgp4@redhat.com>
References: <20210707211951.fyiflsp75i7spcha@redhat.com>
 <YOYf3c5UPMG4yBVP@pendragon.ideasonboard.com>
 <20210707222728.jocrxvqogwjd5ozx@redhat.com>
 <YOYtURGM6VDnOrH9@pendragon.ideasonboard.com>
 <20210708210436.apvu2isib67cmuee@redhat.com>
 <YOohaRa7OWO88Mub@pendragon.ideasonboard.com>
 <20210712135835.qgh7u5f7p2oy7cp5@redhat.com>
 <20210712190716.sbhboki2bms7dx5b@nitro.local>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210712190716.sbhboki2bms7dx5b@nitro.local>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dzickus@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 12, 2021 at 03:07:16PM -0400, Konstantin Ryabitsev wrote:
> On Mon, Jul 12, 2021 at 09:58:35AM -0400, Don Zickus wrote:
> > > - A single client where I can do all my review. With web-based UIs for
> > >   forges, you have to log in every forge for every project you work on.
> > >   That's one for github, one for gitlab, one for each self-hosted github
> > >   or gitlab instance (fd.o has a self-hosted public gitlab instance,
> > >   it's also common for large companies to have self-hosted private
> > >   instances), and I'm not counting gerrit instances or other forges.
> > >   It's painful, I want not only to get all the notifications in a single
> > >   client (that's already possible with e-mail notifications) but handle
> > >   review in a single client too.
> > 
> > The biggest hurdle for reviews I see is un-authenticated email sent to an
> > autenticated forge. 
> 
> I'd be interested in exploring how this can be addressed. We can already do a
> lot of it by relying on DKIM signatures, which should give you a significant

Happy to work towards a solution here.

> level of assurance that messages aren't forged (with caveats). If you create
> the initial Message-Id with strong randomness on your end, then you could use

GitLab provides that as a 'personal id', such that when you respond to

reply+<uuid str>@gitlab.com

it knows that uuid is unique to a user and allows the authentication.  So
there is something there to work with (for GitLab at least).

> that together with the DKIM signature as a fairly reliable authentication
> token. When receiving a follow-up message, you can check that:
> 
> 1. the DKIM signature is valid
> 2. the References: header is included in signed headers (it almost always is)
> 3. the message-id in the References: field matches what you have on record
> 
> This should give you a pretty strong assurance that messages you receive are
> valid and the From: field can be trusted.
> 
> Part of my end-to-end attestation work was to introduce the
> X-Developer-Signature header that uses the DKIM standard with developers'
> personal keys (https://pypi.org/project/patatt/). The biggest obstacle to
> adoption with this scheme is making it possible to use it with regular mail
> clients and not just git-send-email (especially the web clients), so I'm not
> sure whether we can easily use this approach for more generic message
> authentication.

Hmm, I am not sure our approaches overlap.  You are focused on verifying
emailed patches can be trusted.  We are using 'git push ...' to accomplish
that.

Instead I was focused on how to establish a collaboration medium that
developers with non-gitlab accounts can participate in easily.  Basically if
we push patches using 'git push ...' and they get emailed out to a mailing
list, how can feedback emails find their way back into a gitlab service (or
other forges)?

Unless I misunderstood how far your patatt goes?

Cheers,
Don


