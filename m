Return-Path: <ksummit+bounces-381-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2830C3C5D4C
	for <lists@lfdr.de>; Mon, 12 Jul 2021 15:30:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 6F5E53E0FA4
	for <lists@lfdr.de>; Mon, 12 Jul 2021 13:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398032F80;
	Mon, 12 Jul 2021 13:30:23 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0B970
	for <ksummit@lists.linux.dev>; Mon, 12 Jul 2021 13:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626096620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QvBEdB5V8mvr0+QjgDaHi23zq7mA4aVtq70lpBFR+EM=;
	b=FSm6//YqMTG9LyKHvD9rtHRIzKdrK+2JaOv8KI/7Awic55G5Xrdciixn3V17EANIf1f92Z
	1DLH+19t+d/EnrByRzzra3hr7C1SY4offPCb9tpXfh2Rz1XVp52fpAx0//B0fJRRpdINBE
	cM2uZN/nM7PRlD96S3S0IVoBuHpaN24=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-he1kyPWvOn6lOhMDhA89dA-1; Mon, 12 Jul 2021 09:30:18 -0400
X-MC-Unique: he1kyPWvOn6lOhMDhA89dA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CABA68015C6;
	Mon, 12 Jul 2021 13:30:16 +0000 (UTC)
Received: from redhat.com (ovpn-117-23.rdu2.redhat.com [10.10.117.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5438D19710;
	Mon, 12 Jul 2021 13:30:16 +0000 (UTC)
Date: Mon, 12 Jul 2021 09:30:14 -0400
From: Don Zickus <dzickus@redhat.com>
To: ketuzsezr@gmail.com
Cc: ksummit@lists.linux.dev, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [Tech Topic] Integrating GitLab into the Red Hat kernel workflow
Message-ID: <20210712133014.cltekdzbd5fqemkw@redhat.com>
References: <20210707211951.fyiflsp75i7spcha@redhat.com>
 <22d1051d4aa1e3db742349ab213485fe3429feec.camel@gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <22d1051d4aa1e3db742349ab213485fe3429feec.camel@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dzickus@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 09, 2021 at 10:59:55AM -0400, ketuzsezr@gmail.com wrote:
> On Wed, 2021-07-07 at 17:19 -0400, Don Zickus wrote:
> > Submission #89:
> > 
> > The Red Hat kernel team recently converted their RHEL workflow from
> > PatchWork to GitLab. This talk will discuss what the new workflow
> > looks like
> > with integrated CI and reduced emails. New tooling had to be created
> > to
> > assist the developer and reviewer. Webhooks were utilized to autoamte
> > as
> > much of the process as possible making it easy for a maintainer to
> > track
> > progress of each submitted change. Finally using CKI, every submitted
> > change
> > has to pass CI checks before it can be merged.
> > 
> > We faced many challenges especially around reviewing changes.
> > Resolving
> > those led to a reduction of email usage and an increase in cli tools.
> > Demos
> > of those tools will be included.
> > 
> > Attendees will leave with an understanding how to convert or
> > supplement
> > their workflow with GitLab.
> > 
> 
> Hey Don!
> 
> This sounds quite interesting to not just folks who are invited to the
> kernel summit but also those who work on distro kernels day-to-day.
> 
> Would it perhaps be worth doing this on also on a venue that is more
> open to distro kernel engineers (who aren't neccesarily invited to the
> kernel summit)?

Happy to give the talk at other venues.  I already presented at devconf.cz and
CentOS's Dojo as more RH focused events.  Happy to present this at a general
Plumbers talk for my eyes and ears.  Suggestions?

Cheers,
Don


