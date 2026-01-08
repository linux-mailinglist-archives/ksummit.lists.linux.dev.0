Return-Path: <ksummit+bounces-2711-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FCCD03366
	for <lists@lfdr.de>; Thu, 08 Jan 2026 15:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8746F30336AA
	for <lists@lfdr.de>; Thu,  8 Jan 2026 14:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68364D3DCF;
	Thu,  8 Jan 2026 14:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dEAlJz4A"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9084D3DB8
	for <ksummit@lists.linux.dev>; Thu,  8 Jan 2026 14:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880879; cv=none; b=Yg32CEoNGrF4j6EL818T0hd8lLiob7yQQTqxBjpWex/m61Lt8bcoAeb7Z6aCDv0QfPhdSkaA470SJb4FogeTc78UyVBIbiGYgDpHH2JYEKkV306yg0XEzldralSuYpcT03YCCz5sQ5yrMSGrIGXXO+t8avaLMahEUDOkKox4DI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880879; c=relaxed/simple;
	bh=Olp/7PDcp4pfbc+UbzZJFHgTZlJf7wLjtACvo1ZkneQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Uqf3GlobrfmCJHBBg2t0j/On1AlDlCSromp2qwXCzN1SteltyUuPYuDiz6RtaOy4JwkKARHE/1NJONPjpbKD/WV8+3R1hrB7zpvNqEb/iLOxoc7DHQe6DT9/J0LnwDxVEtHxUp36D2sb02xu6v49X20FoLd/7lKqooaLHHuRm5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dEAlJz4A; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767880876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CYSOF6mF7x3oRna/23J7sz+or3u51CnJIO5U+uhfHKM=;
	b=dEAlJz4AIqrpXF4Cfj05V+UU9cY1wVpfVduCxoN1tXNN9pWyphxaz4dssVRUVrCJtM0UXO
	I7c+JIDhSoNHKJVKXtYZBRear8Tpb3+PZSdqkAlfoCfpRn/VQMUQAi+cx8hDvw/gFiShGi
	4B041TypiCvAxoZlgbMbnRGMCQxLyV8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-TAdQJ7OOOTGWpYXOcRintA-1; Thu, 08 Jan 2026 09:01:14 -0500
X-MC-Unique: TAdQJ7OOOTGWpYXOcRintA-1
X-Mimecast-MFC-AGG-ID: TAdQJ7OOOTGWpYXOcRintA_1767880874
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-430fcb6b2ebso2099834f8f.2
        for <ksummit@lists.linux.dev>; Thu, 08 Jan 2026 06:01:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767880874; x=1768485674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYSOF6mF7x3oRna/23J7sz+or3u51CnJIO5U+uhfHKM=;
        b=HGlA95yIp06k/ayWCILNhxKoaLG2keFqGFkmw/lszl4I3pmKJhHkZUf08hTzrc6ZJh
         6CKw4Z8QKdihovBnQshng67GoI8ZehPmojHsZ9d9GMgmNKQ0yJi6u/AlYD4obDslm9d8
         sOEVLNYo+ckyGO1kPaSSFkzZ1fvSq35Nv77j+kf1w/qNKIp6fCYYs8exyyjd7aF0GfFc
         HIh07x/jGXPkHB4g8DgPCYh2KSCHsljQgXCV4Vci65lDS5pWE+65qtK8c+GboKO2RW2j
         Y6Ngiye5QioAi8cRDSE1+Jcyihx/yu9fcy+6A5YwICK25t2u0kxnl5F+Wj0eZNFrNCUI
         FQPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5xqWvN33ArsGuftM0HrwaOyd64DJgZ4wO5eulEF4MXuEYmwLVmSThQun/QPWXiCfeugr3AvBq@lists.linux.dev
X-Gm-Message-State: AOJu0YwQ2jjVNMpl1KB6awYJB89O6rjMn86LnM9iO/EFGm8/w2S+MowZ
	9qERoPdLGcKKQeGImsUmdlqd0X9j55pOjAWsUPTh+b18n6wH789ELKI37UaMEUQ2WAh9Dxh4ceZ
	KpwRn10zdfhdMZWjwvp9QzzPFwrZGzy4Wcxnj+i17h1Ac0HzP0+GU0rlP60c=
X-Gm-Gg: AY/fxX6fZOpgMqhXRGopNg00zesMFOVydxKUSct7TBOIP6tInbmyzKPEIYd9lg7Ti1C
	bImHj5Cvwy5LRD6c2kwYzqSpXOO57661Lfgprpa6SW5lwIkTu6GsI1zIFJcrcCS34DTCcmfEurt
	hnCBMXkxGf7WZHe+icLyDq6GZkpA7LpIuPHfiP5Mw/CH8/ivjRPGy1gavfZ4B1KhP9Ye94FrTPK
	Gsvch0VOO2aOseAcDTL37oDNx7SRl2m7TlC+T7U1qXQ1pdfSv5gFZ7AZ6CxSI0ZCSuw/8rWuzd7
	YTD9iyf0XPA2p2wEueYqySeJS2GI1/dzeSwUrSwGJ6glGX13kPjlV7RvzZHTNCVl2zod/3Y2fYl
	oDot7u1/5da9muwLVGpgVxl4ijZ4SFkcxTw==
X-Received: by 2002:a05:6000:4212:b0:430:f718:2388 with SMTP id ffacd0b85a97d-432c36280a4mr6556186f8f.8.1767880873578;
        Thu, 08 Jan 2026 06:01:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHm/a8Op4VxDRewkYvy7Ttp0lyCXYhf1e9mMnsO3z1A/P2eW7eKeXkhTeBr0UpojXRxrykzLA==
X-Received: by 2002:a05:6000:4212:b0:430:f718:2388 with SMTP id ffacd0b85a97d-432c36280a4mr6556129f8f.8.1767880873038;
        Thu, 08 Jan 2026 06:01:13 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm16341359f8f.4.2026.01.08.06.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 06:01:12 -0800 (PST)
Date: Thu, 8 Jan 2026 09:01:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
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
Message-ID: <20260108085215-mutt-send-email-mst@kernel.org>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -_Ka4tbqS6LGJFTOw8wRNdIoXriyGCHpkwyiIS1h9Oo_1767880874
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 08, 2026 at 08:17:09AM -0500, James Bottomley wrote:
> > +you are expected to understand and to be able to defend everything
> > you 
> > +submit. If you are unable to do so, maintainers may choose to reject
> > your
> > +series outright.
> 
> And I thing the addition would apply to any tool used to generate a
> patch set whether AI or not.

Exactly. I saw my share of "fix checkpatch warning" slop. This is no
different.

-- 
MST


