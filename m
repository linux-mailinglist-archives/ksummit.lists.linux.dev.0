Return-Path: <ksummit+bounces-2714-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D71BD0404B
	for <lists@lfdr.de>; Thu, 08 Jan 2026 16:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D2683233556
	for <lists@lfdr.de>; Thu,  8 Jan 2026 15:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DBE40F8FD;
	Thu,  8 Jan 2026 14:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JC8oE1P4"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD12A40F8E7
	for <ksummit@lists.linux.dev>; Thu,  8 Jan 2026 14:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767882500; cv=none; b=RxWV2KZhPjkK+iEmBNf+J6bWL9lWNJtcTudYTFAYCbqlprXaHahO7CRv0vJSRINeaf77iRWxcVauPPt03vqWB59Z11fIVNKzdiGbQZ0RbYlqsXDAWsWXszHfsSVW2btOQLsBfyiUXrk8j5cH9roJ6H1uSTmgpCgVCk0wcPAq/Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767882500; c=relaxed/simple;
	bh=DE2y1HqrcJCFk/kMbi4+q2pd9Jr7TUkFtUY/sO4aTcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=f5UH62htAX0dxGHGthr7H1DrpOu5ZAXuXy8hN0cldOR2Vom5gy5K/pyQ7AqNU2l1XqyiSbhR7iri/dutHGaHL6m6sDKm5LbnEbLICaWj9lPf7/LyLAJb8l4n6+FIZZsP5zf0OLQhWY7OD28hQQILCQkbbK6Qjd2d0TtilLLk5lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JC8oE1P4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767882497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BpTRDQlIxcFXCulwFzUoKCs9Qpfxsh6GYCQo5Gp9pJ4=;
	b=JC8oE1P4MW0wb/EPS5XyaPcULwqjbUIrzReVYgedAe3BTpt+rXK/X5h/EmOJDLyfIJD58U
	e1g2YFIqZOBqrzUfdoaq+h/keHwfVcPtljS6Qkui413L3OIFVL0vEP9bpVOTXqNxXUuyqK
	Z5ath0NiWw63LNLpiZYp+bUnNB23TFI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-eZtxMQz-NbWsUuTSTa_dVQ-1; Thu, 08 Jan 2026 09:28:14 -0500
X-MC-Unique: eZtxMQz-NbWsUuTSTa_dVQ-1
X-Mimecast-MFC-AGG-ID: eZtxMQz-NbWsUuTSTa_dVQ_1767882493
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4792bd2c290so34346155e9.1
        for <ksummit@lists.linux.dev>; Thu, 08 Jan 2026 06:28:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767882493; x=1768487293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpTRDQlIxcFXCulwFzUoKCs9Qpfxsh6GYCQo5Gp9pJ4=;
        b=o+kQ1tGZ6H7XurEb/zZvS7geeS9ZiMn7mgQl+kNj01dRaXVe6x9KYRDUL31sNjfRUc
         yXUapidegVTzEBXldvrYCL5KnzT3Ck36KPaeBF259DZSJQJKWnBMstfyLHdiqGRep1UQ
         BGPSZiutwJqTYahJIpZm6HKCIh/WZoI6s1mpO4iwI4rwpCJCtRpexJKsezny/pVkfCi3
         iJu40gjNJ8IwnyLnmAZ1aBwl8C3EtJilDLDm+ZNh+j3+iIkxHRoHd4+fqbPqf+A6c/wP
         moJqRS+3AwkWPWCHyRk7DxT18DgmcBOvhl6ZSTp3e3Hj/ghfV/kBlbWSjFcZfSwgN79p
         vqMg==
X-Forwarded-Encrypted: i=1; AJvYcCXGTdxcwDkD6hePOpPPoD++/iSEitJxLjdpAAJucLh3c+uCmCyRjJqLxY8ZfMO9xp8Wn7wZidcD@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4du+GFuUZnuzzJi0Qf19V2ljmwtJKZBcocJFlvYdAms72CQIL
	7YSSqkxUSEQaITGh9fqV3fJj6KrCmb5oEU0d7N5NTm8eLvSstCPGxn3MG3uxaqeJhIR4gei82VL
	6H2Uj+KCw2XctWdRGIyeef1qy4RVTtU8SYqemy5aYEIUA9T+2CVw8HtwfTSw=
X-Gm-Gg: AY/fxX6TsjNQurqf8oloOxV2FSA1kEnDWavUKkQ24TSwYWBiy3kasGkOkDBSeIx2n+N
	2GHRqqFiPjo+ZY4dFn0Yje2aSOZ/O0f8qCAPNxn4M1i93Ph4beu5PTOmMqjPyc/zrdjbqM+uBnV
	xTzUagO0c6BpaA1oG9OAsBIxoEoEBVqt9qi7hw7V9bJM1gsP+LENUOCIF6YIoe09sv3rFTc8xN2
	FKmNqrjYgxBe6Ao7foN2TsDIdHai9zH8EDhXzIs5b8mzRUmMlSTfp2F9j09oyLXPd7uIL+MtMYZ
	5xbmkSrGINlJnLJUK0zWx4HBpsHSJaAt03d/aSiZYcVOuZNyfaXZAJXtw/iGZz+3ZDR/RAt41ak
	vMIrvmPXpBpgllPGPumkTXrFoUGzrMCby5Q==
X-Received: by 2002:a05:600c:1994:b0:47a:80f8:82ac with SMTP id 5b1f17b1804b1-47d84b39efcmr69410665e9.26.1767882493186;
        Thu, 08 Jan 2026 06:28:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmzcZk9KuSpzaquYlUFM5a2Lb/iJQyuay1ZIAjDNNTlkmw0qm51UfxWeQb2Wpv2ceJg5hw/Q==
X-Received: by 2002:a05:600c:1994:b0:47a:80f8:82ac with SMTP id 5b1f17b1804b1-47d84b39efcmr69410425e9.26.1767882492692;
        Thu, 08 Jan 2026 06:28:12 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f410c6csm166770965e9.1.2026.01.08.06.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 06:28:12 -0800 (PST)
Date: Thu, 8 Jan 2026 09:28:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
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
Message-ID: <20260108092635-mutt-send-email-mst@kernel.org>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
 <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
 <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local>
 <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
 <20260108085215-mutt-send-email-mst@kernel.org>
 <b8dc3dae-2d48-427a-be91-bcca53424d53@lucifer.local>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <b8dc3dae-2d48-427a-be91-bcca53424d53@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 704dfSnvTMySeeYxWeQt0NE5FQJGnbylW90u2TKYnBs_1767882493
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 08, 2026 at 02:24:55PM +0000, Lorenzo Stoakes wrote:
> 
> At any rate, even if you feel this is exactly the same, you surely therefore
> cannot object to the suggested changes in [0] which would amount in your view
> then to the same kind of dismissal you might give to a checkpatch --fix series?

I have no problem with the suggested changes. I am especially happy that
they say "As with the output of any tooling".

-- 
MST


