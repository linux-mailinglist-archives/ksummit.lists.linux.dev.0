Return-Path: <ksummit+bounces-2717-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BEED03B83
	for <lists@lfdr.de>; Thu, 08 Jan 2026 16:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CEB633276EC
	for <lists@lfdr.de>; Thu,  8 Jan 2026 15:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF89734CFB9;
	Thu,  8 Jan 2026 15:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F3FbgHA+"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C562434C990
	for <ksummit@lists.linux.dev>; Thu,  8 Jan 2026 15:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767884528; cv=none; b=I96z4667PUBiGDYfcPPzQpjJ9GtF0iOQkFDghjotNt35oHSGMUxQl+vu/i9GQXmYEsdmlEZdO3ZkepWFvtWr/7XK3Zr7KkDG1wdILIPaVt890cryliUkxHvfcNpsVS4B9BWNdynstswQ7ikgvZbvqA0GLXSZ696FJfqU6ygGIgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767884528; c=relaxed/simple;
	bh=VUzvpOflNwjX8qoWsZCIAI7QfJt5lUXxCOmPmPt6i8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=a+l38IfOgU1TVNncXwsjYOnFDAgCyR3RIAMNtAIgQwuGWKNuYv+LPxHGSmMKVUrHXPiXMSfxKi60fOPB3qtpcyBr17G3RM2ku5ntkNZkuAbg40fia/bkZxzyKcBgmSelbdvGFibt7nu1vkEAr6aeO9l/etS0MJwrUsFkSXDB07M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F3FbgHA+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767884522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZUCbWsJcBFgu60iEmXCpcPHQf+Gi4FoJmWQOv8WbAdM=;
	b=F3FbgHA+NIBY/lj2w/fO/qLSBeyjm9YFcst3OXEpgMWRpBo0TExcunPlp50gBpqCg+r5zC
	/nUHqGgVSErNPJkh3HJReNccT8eAHTCBZFX6xUR4mFFvMmaDYOjhGb1V66vGQqcfqLCuwv
	cVq57Ch451vhBj97l9qzcYq3kWrIxf8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-cFL1_HDiOdqJS_SGEyI2IA-1; Thu, 08 Jan 2026 10:02:01 -0500
X-MC-Unique: cFL1_HDiOdqJS_SGEyI2IA-1
X-Mimecast-MFC-AGG-ID: cFL1_HDiOdqJS_SGEyI2IA_1767884520
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-477cf2230c8so31568495e9.0
        for <ksummit@lists.linux.dev>; Thu, 08 Jan 2026 07:02:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767884520; x=1768489320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZUCbWsJcBFgu60iEmXCpcPHQf+Gi4FoJmWQOv8WbAdM=;
        b=SvMmXye7ykRpFwMSB0eEh0axWU+5NMFRLj+NhvAG0NuEY4kF7Z91SJzQbBY6L0Ovp5
         3+CMuRdoSNfaxlFAbyCpBWvDh36fRGLrjHOjBmYrmId4m1DIzX8XkL/P46fOkehv/obx
         lSoKMYfzhqhFgXlh0Ny+hqZwNQSznJZlp0YUn0Hup5EwIIS4NcLybu/qhY+7vql/uwM8
         Z1GBOiDYQq8sx1M17rABNDT2Usadm9Mp/o9BhyZS9oY2U5D/+s+t2PPRbR+BQJBxtLDR
         g9JB4dSvciK8OGPu+inv2+7j/R4z8Q8ZpRZQdgpP1Be7DdMoAIH82Og0f/CVi80JLzHa
         JbFg==
X-Forwarded-Encrypted: i=1; AJvYcCWS+apI1oNvRUK2PaPXC7lYqoN0ikZwPHjLUcNBY6wElKCuvIzo1ZL5a/CWJ97tsSSlQIa0NW9D@lists.linux.dev
X-Gm-Message-State: AOJu0YyQO7kHLZhEOBH7StrM94JzvyPKJRVSpzJ7ldtXWylRAGywp31b
	NTnm8Kxe6qLhj39uVSJg52KvwmDXIcn40z5VCAIb22mkVn+D2wJk4XoXOdOImU76U3bGagYAm5x
	Z7V16YUUs2xUWZ1pEdNW6ElPDXI8ig+JRUt7C/WUibcrUOyq+hcLIzc0+63c=
X-Gm-Gg: AY/fxX5BcFnkWEVUNc9v0PD4174mzd5w3uwT/vE2tZ2uIgnee4N4C3Zo67Wl8csjZpE
	LybEoo2PuwHGuQeHEBeYXviuKCEMH+xhcEdJrh3RKN30ez28rJJ3O46kqW1yTk2txL3Hax5slA9
	o+lDqxRaaAzVQ8vGqnq+y2FoS5Bzk063c3VHJEhFVl9xtOQtyb0I8iTVu6EZmbFjyCQUqqSUI2o
	UYiFmcl5QZSlmF1jdrYDpqU1lFhdE+LIrwaCmO2pfVkn1d/1vFVu5lV14rcZOL7Xx7yLQsZOLAY
	nDw9nru6Ekd0FNU/nFGK4QFCY5SE5spt/IRXaeCYu81h9r8ekwgyKRpmnbCxRJakgFZIDJduF2d
	vDsAOaDwWYauiq9XU9wp3VAgILUjO0nKBbg==
X-Received: by 2002:a05:600c:820f:b0:477:aed0:f40a with SMTP id 5b1f17b1804b1-47d84b31525mr73188695e9.19.1767884516357;
        Thu, 08 Jan 2026 07:01:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVBpNsSpVO2K/vxy9aKs0+DGY42cpJHMoSK2T9UmlwTpmiJg1Qf8QGkotIb0+omrlpiL19Dg==
X-Received: by 2002:a05:600c:820f:b0:477:aed0:f40a with SMTP id 5b1f17b1804b1-47d84b31525mr73188285e9.19.1767884515874;
        Thu, 08 Jan 2026 07:01:55 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f4184e1sm154399065e9.4.2026.01.08.07.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 07:01:55 -0800 (PST)
Date: Thu, 8 Jan 2026 10:01:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dave Hansen <dave.hansen@intel.com>, Dave Hansen <dave@sr71.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Steven Rostedt <rostedt@goodmis.org>, NeilBrown <neilb@ownmail.net>,
	Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
	workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <20260108095933-mutt-send-email-mst@kernel.org>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
 <20260108085215-mutt-send-email-mst@kernel.org>
 <6041b4b8-303a-f12b-24ea-92b836b7a025@inria.fr>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <6041b4b8-303a-f12b-24ea-92b836b7a025@inria.fr>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 10TEPtGujQko1GadZk3kWLXzySEW8-cESYS6Tn4Fpco_1767884520
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 08, 2026 at 03:48:14PM +0100, Julia Lawall wrote:
> 
> 
> On Thu, 8 Jan 2026, Michael S. Tsirkin wrote:
> 
> > On Thu, Jan 08, 2026 at 08:17:09AM -0500, James Bottomley wrote:
> > > > +you are expected to understand and to be able to defend everything
> > > > you
> > > > +submit. If you are unable to do so, maintainers may choose to reject
> > > > your
> > > > +series outright.
> > >
> > > And I thing the addition would apply to any tool used to generate a
> > > patch set whether AI or not.
> >
> > Exactly. I saw my share of "fix checkpatch warning" slop. This is no
> > different.
> 
> I guess that most maintainers can easily recognize a patch that was
> motivated by checkpatch, Coccinelle, smatch etc.  Then the review can be
> informed by previous experience with the tool.  Will the same be the case
> for AI?  Or does it not matter?
> 
> julia

It is not the issue that checkpatch motivated something. The issue is
that a lot of people don't understand that "checkpatch complained" is
not motivation enough to make a change. I expect this holds for all
tools.

-- 
MST


