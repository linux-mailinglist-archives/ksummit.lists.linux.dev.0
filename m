Return-Path: <ksummit+bounces-314-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B69F3BF150
	for <lists@lfdr.de>; Wed,  7 Jul 2021 23:20:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 813CD3E1011
	for <lists@lfdr.de>; Wed,  7 Jul 2021 21:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73022F80;
	Wed,  7 Jul 2021 21:19:58 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04501168
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 21:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625692795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=IhtCfp6YoXhrb6Weh3uSeVvZXCP/xZIfp/J3kNWJjzk=;
	b=gIQIqugSQUJzQkhET1PtkcS/r28i8czm1/aCmf15HprDGkv9C6n70493DuynnF5PVf4ode
	uRdZkZJH3pwYlI6HqMivTdkf5zevzGjjjGYAusZMDjtuTWxs1O9GOEXg05V4PjufpUGhdv
	vHzmaWk+aoA244Bw48ufhikRweCJ7Xc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-PQwDFq56OvO_yqaY0GvaEQ-1; Wed, 07 Jul 2021 17:19:54 -0400
X-MC-Unique: PQwDFq56OvO_yqaY0GvaEQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 717611084F40
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 21:19:53 +0000 (UTC)
Received: from redhat.com (ovpn-116-226.rdu2.redhat.com [10.10.116.226])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3303860843
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 21:19:53 +0000 (UTC)
Date: Wed, 7 Jul 2021 17:19:51 -0400
From: Don Zickus <dzickus@redhat.com>
To: ksummit@lists.linux.dev
Subject: [Tech Topic] Integrating GitLab into the Red Hat kernel workflow
Message-ID: <20210707211951.fyiflsp75i7spcha@redhat.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dzickus@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Submission #89:

The Red Hat kernel team recently converted their RHEL workflow from
PatchWork to GitLab. This talk will discuss what the new workflow looks like
with integrated CI and reduced emails. New tooling had to be created to
assist the developer and reviewer. Webhooks were utilized to autoamte as
much of the process as possible making it easy for a maintainer to track
progress of each submitted change. Finally using CKI, every submitted change
has to pass CI checks before it can be merged.

We faced many challenges especially around reviewing changes. Resolving
those led to a reduction of email usage and an increase in cli tools. Demos
of those tools will be included.

Attendees will leave with an understanding how to convert or supplement
their workflow with GitLab.


