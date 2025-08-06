Return-Path: <ksummit+bounces-2094-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C34B1C34A
	for <lists@lfdr.de>; Wed,  6 Aug 2025 11:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00C4718A8021
	for <lists@lfdr.de>; Wed,  6 Aug 2025 09:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE21E28A1E2;
	Wed,  6 Aug 2025 09:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lB6PnnZQ"
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B650C28A1D9
	for <ksummit@lists.linux.dev>; Wed,  6 Aug 2025 09:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754472366; cv=none; b=GliRZHCS6CYmnGwAVgtjNebac0Jr2sEKlHrpXxPnzsnpyMoN+9MNSrGgZlfDI9GHqo4/af53k5sVhNII7LuJaFgrR5TLzoeVtAHaltx93onNsBYtqHx4z504Cbn0nskvnzO3saloVPMAPrX1ljOBRntT0Pt6oNQrLK2BBGfR3ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754472366; c=relaxed/simple;
	bh=k4ZQaF+Rh51mkq6VS/z2D4svkSe0U6SRol7WAOwx60o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cgt3xOwOOJQlxncdtOGQdgOfd20QC/wxLvp//IsSKUQuVL8c3QDrDjGpQwS+BwBhHa3q7AKDDSyHCp0IIb1b3MBRSwFCZXqoBV37yPHQH3/1nP1HVVIvkEUqJe2Gzm++xskSFzwW8x2XPPqmjsRcYx5tJfesjleWcSEW9uGxnbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lB6PnnZQ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-459d7726ee6so21847745e9.2
        for <ksummit@lists.linux.dev>; Wed, 06 Aug 2025 02:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754472363; x=1755077163; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5sc34BlaLH6pLcNulUuhDIPVjI8H3RYq9BeK7bk9Ck=;
        b=lB6PnnZQonCiCkso66SZNCuZ7gdPcQBl+pXkSn8wYLGT3SL8E4NLrXnEu5f8QlJno9
         Ob1Ia9m9Muugq1WxO3URrn3/myvAqutb4dwwx1Efm+hOTPYaXRqC7IFfqBvMjCW7tmba
         EVVaTzp3NY739Z91zTBbw/SFnicToK6hgDw0KMcRV6RbJXYg9Ptcy+mazY0mcXid2aMZ
         ONFu36/I1ZW5JvncqGWzR43emdMdrMt7yzBM5SY3xnrVFPrexOzOZYJdofWP3z4o3HBL
         2gMKjkx+nC8Q5i69iXdwPxqziNB/U0qc3vea0Rq9bo7ztR/R2em2+wIlog/qcm0EcJzy
         Y2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754472363; x=1755077163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5sc34BlaLH6pLcNulUuhDIPVjI8H3RYq9BeK7bk9Ck=;
        b=uVTUYioKedu46LuxGYvOwn19u2kSk7vvuw4Y0DwqvckboU4a0kmBBAVPwBybe8Rcnm
         KJ1qxewQsE24L2HiSauVFNFdyrDemzsCf7EnsflDUbost7A9jzFM7mE0Zr8NA0mYUiUP
         fO/Ob5O9msmlEV12KhdgAY627g/G0kaTw7+EYTe+Gbn6FZBrz2YMxNFytcwciD4oAq5B
         +dCZ0XJtfkeiLXfQoDXB9tfPJJ7jaN9FQ3jRtBADD42Uu5V1TfnjSPsbVjumdTQZl/xK
         Iv9bQDLrb8ZSu/i5UsXU3Tdgp0drm7GWw3xnpII22zAmhhvMdnHmc4LAOCQhjLD2uJCf
         jfEw==
X-Forwarded-Encrypted: i=1; AJvYcCXjF3rqZ/n3qP4A+uluLJqrCVD7Yu5XwKaa9n2oEVivBZKEp7qv6OzfHyHVn5Ln/dSHzgjaGfNE@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+OVv/lyPJiUTjdSI4R17UpsotfmR2aybEwW1o1CZBYocoiOYZ
	zr2HRIZNO4lqXoXTtX9A1MsQ3J39jiY2EzG9Zk18lyzUo5E833mor32QFWcGMa0iYdI=
X-Gm-Gg: ASbGncungH+/g1A8Z5HmKdIJTWpd5Nr8qWfxC4UAY2MD/l3jHDCkSzxHuT3isEpb7Qh
	czfoXxvHayglg1g5exH/j7CHlqnUXMjWfGTmxAP2+SFkiZ4lQzRN6RJqCmFimwE0t0QM1X4AIZJ
	Yj1WDk8wuMh6bFSJMxapcpcLF9SdIKD2fuUElahqBZoYQ9zGWTy1sGbVK199f8BKk+FaBbbZbf1
	iXJrcsnyyx+C5tvOs7nBpUkSpj37AHrl3nh05PFIrp8AgYEEnywW2Z+vG9x2t1osj6PiC72L34l
	XFyFhcRcMFigxLfQPgdnhvhXzRW9zd1REZioWX8eVILtJPYzIAih0rLsDjw0+omMbjl0aJ2slTA
	FIDu6Ux646CvMDRakLNmVPZj0bxglAUDIvENSxg==
X-Google-Smtp-Source: AGHT+IFL+6mD5k8PjFCvfP+ZA9nBy3h9LY7oVSivutQF6hkOalxb9ySGdNkKe12iQMWDQbAO2927qA==
X-Received: by 2002:a05:600c:b90:b0:459:d9a2:e920 with SMTP id 5b1f17b1804b1-459e70801d4mr21590985e9.4.1754472362983;
        Wed, 06 Aug 2025 02:26:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e587d378sm39155245e9.23.2025.08.06.02.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 02:26:02 -0700 (PDT)
Date: Wed, 6 Aug 2025 12:25:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: "H. Peter Anvin" <hpa@zytor.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <e52df6bb-cee3-46e1-9e05-6abb42174c85@suswa.mountain>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <37BCAD5A-07C4-4119-89C2-D3A45C24DE18@zytor.com>
 <alpine.DEB.2.22.394.2508060747440.3518@hadrien>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2508060747440.3518@hadrien>

On Wed, Aug 06, 2025 at 07:49:24AM +0200, Julia Lawall wrote:
> 
> 
> On Tue, 5 Aug 2025, H. Peter Anvin wrote:
> >
> > Another genuinely good usage for AI is for especially non-English
> > speakers to tidy up their patch comments and other documentation.
> 
> There are also some parts of the kernel that are supposed to have
> comments, such as memory barriers.  AI could help ensure that the comments
> are actually meaningful, and perhaps suggest to the developer how they
> could be improved (sort of a 0-day for comment quality).
> 

I feel like I have seen patches where people have generated AI
documentation for locking.  The problem is that if you ask AI to write
something it always has a very confident answer but normally it's vague
and slightly wrong.  It takes no time to generate these patches but it
takes a while to review them.

regards,
dan carpenter

