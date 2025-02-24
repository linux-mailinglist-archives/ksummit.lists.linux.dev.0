Return-Path: <ksummit+bounces-1868-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FBDA416FB
	for <lists@lfdr.de>; Mon, 24 Feb 2025 09:13:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3551A166D92
	for <lists@lfdr.de>; Mon, 24 Feb 2025 08:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B18924167A;
	Mon, 24 Feb 2025 08:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NOStbMZp"
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A9E17548
	for <ksummit@lists.linux.dev>; Mon, 24 Feb 2025 08:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740384783; cv=none; b=ctXFpihdsNnXjsfDiiBKXxZW5uTtsGqCycrye+x0lU1RojBUaBqGQXWjHj2nx6xokgOy4vNOONngNRSXnkq57uwqLX8tEwy4AnIMrkIUT5/sdbCWeyWzpqvmF++BbATtXOaLIb4bshGIZhuir2Z78uVGv7wbsjVK1CkSFGpVZ9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740384783; c=relaxed/simple;
	bh=zm1XGdW8b7MAbdzYL+ivC3Vm7Q33WGsikbRPl+MehKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czTwy8XJEesUdI3NslJe6yWOlLNxItyQLAuT8b3RoOtRXBhQFjubui0J8+RIQFicG6cpj5RvzF3GkBmc77J7c9FuL4EqbkeAcSWNCx2M2vxIUp1UO40Vj3sz6dJjN0sD9zNBRxGWRi3xmQbTGiyBh+XPCPWLyNMiyz958f+Tj5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NOStbMZp; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5ded6c31344so5879232a12.1
        for <ksummit@lists.linux.dev>; Mon, 24 Feb 2025 00:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740384780; x=1740989580; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oy/VDejTz9+C/5BlUy0JQ2ySPwy1T3j7TGBJKfwzWTE=;
        b=NOStbMZpwFBIVq8N5DoBZ8F8ymB8vLiSm3Ldhyh2cRFoXcAKCzWiPyhzkIR6nk3oYf
         nYUUFsB19lRDr2x4LKvQBNfU8N7YYnnuahp9nSHlGMwefq8WxKPHcT7jBWLrOpTnd1av
         VtaUxwcd4Y5SfFh3V/5uC5W14lJbEQ4YEIV/Yg/a9790jvxpJ9aK+GngtnBcEZ0VNSiL
         zSoTD9W58pSy1HO8Cz1BSg5MrPoMsvKEraTU5ysOVos27NdDdyQN5Q5yHTAjzNwFEXMi
         Mch8rgBXMuj0uVe3dfMcQwauQnfdaYHCyQzTPLublOELdFzN7UhOcHHc0cZSjzRKG27H
         0rHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740384780; x=1740989580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oy/VDejTz9+C/5BlUy0JQ2ySPwy1T3j7TGBJKfwzWTE=;
        b=t7cknN39VQ/VNfoHM6DxaGrjTq5SnTtT4znVRwdDGhrQr7yVl4xpK1qC+fIGiLojdf
         pxwyPEPGTVGXuzS4k9d2f+FoeOof8meLHtW4VZ0IW3GYlWB4b2v71ONO0P8jiFXPYNmk
         fftUJicFD6M4oCLwynl/YnlQA3hpFB5cYvSRPGORlEbpnpuvJ4Obv/J3Zt1qltfWCQQk
         wO2M8x8xAc08QahiXsqlP37qgtLLSwuGG8X0xg8ewmHoZiIjyfqJBiw3tMmraXSalowb
         JGhLiUmp+5WAa9/kWzhf+y72ym6pq7rCV+ArFsBeTkGYGEUNJt3ObTZ38dyEPMmwOvQh
         UFfA==
X-Forwarded-Encrypted: i=1; AJvYcCXlwrIy0xK7R8ubOyMI57uBq5W0E4a/vhveczynuQw7Cto5O13TNHl7ThX0e1gRzrdemxKfnmSg@lists.linux.dev
X-Gm-Message-State: AOJu0Yzoaled6uKNeeFYwFcNSAEVagQuRUZkHlSC32n2TfnK11eBrgOV
	Hg/37jUgdDhIH6VauoXJ1rCxWEquKee/zVEv2g0vdIm2S4HmaSRsR661wpKREm0=
X-Gm-Gg: ASbGncuwuw9F03uKltfuc0PBUoh6qU1nk7cijBRjLzlXpbS1eIGJp3i+UMqI0r2Q91+
	AxOaKTY9iqpg0PiJRb89MP5D5odBU/ShLocACH47hK6kDhftFmyX7t0JGwbAL6RIQCViW0uKhbE
	bq0QKMGlA0ubTVqvxocd2ebYmEbSKsZyS1hYk4J45yS/0BbfNYS93b9LX/4aKqgyP0QXBldenYH
	uDFEvDLsgmmb4+ppEV+dCIaSDu+uz0rXxhV7YRAOC3Ef2wBRooKH8IxuZS3Lk/L5O+e812EbyiL
	nxHRSD8dld099xtQ3KdFpq4IznPe2uQ=
X-Google-Smtp-Source: AGHT+IHsJX9ApcHkuTvjiz8vGIYCMMUHA/6LWXZOxZXsrIXHc5WgXLFFAoSh0lWFQE/xDMuQC0Y3EQ==
X-Received: by 2002:a05:6402:3815:b0:5de:b438:1fdb with SMTP id 4fb4d7f45d1cf-5e0b7266b9amr27595493a12.30.1740384780220;
        Mon, 24 Feb 2025 00:13:00 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abb7200144fsm1792040966b.184.2025.02.24.00.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 00:12:43 -0800 (PST)
Date: Mon, 24 Feb 2025 11:12:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Martin Uecker <uecker@tugraz.at>, Greg KH <gregkh@linuxfoundation.org>,
	Boqun Feng <boqun.feng@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: Rust kernel policy
Message-ID: <9a134f1b-a661-4372-9336-289d5734bcab@stanley.mountain>
References: <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com>
 <Z7VKW3eul-kGaIT2@Mac.home>
 <2025021954-flaccid-pucker-f7d9@gregkh>
 <4e316b01634642cf4fbb087ec8809d93c4b7822c.camel@tugraz.at>
 <2025022024-blooper-rippling-2667@gregkh>
 <1d43700546b82cf035e24d192e1f301c930432a3.camel@tugraz.at>
 <2025022042-jot-favored-e755@gregkh>
 <b9a5de64fe1ded2ad3111763f35af9901bd81cc4.camel@tugraz.at>
 <caea3e79-78e6-4d98-9f3b-f8e7f6f00196@stanley.mountain>
 <20250221181154.GB2128534@mit.edu>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221181154.GB2128534@mit.edu>

On Fri, Feb 21, 2025 at 01:11:54PM -0500, Theodore Ts'o wrote:
> On Fri, Feb 21, 2025 at 12:48:11PM +0300, Dan Carpenter wrote:
> > On Thu, Feb 20, 2025 at 04:40:02PM +0100, Martin Uecker wrote:
> > > I mean "memory safe" in the sense that you can not have an OOB access
> > > or use-after-free or any other UB.  The idea would be to mark certain
> > > code regions as safe, e.g.
> > > 
> > > #pragma MEMORY_SAFETY STATIC
> > 
> > Could we tie this type of thing to a scope instead?  Maybe there
> > would be a compiler parameter to default on/off and then functions
> > and scopes could be on/off if we need more fine control.
> > 
> > This kind of #pragma is basically banned in the kernel.  It's used
> > in drivers/gpu/drm but it disables the Sparse static checker.
> 
> I'm not sure what you mean by "This kind of #pragma"?  There are quite
> a lot of pragma's in the kernel sources today; surely it's only a
> specific #pragma directive that disables sparse?
> 
> Not a global, general rule: if sparse sees a #pragma, it exits, stage left?
> 
> 					- Ted

Oh, yeah, you're right.  My bad.  Sparse ignores pragmas.

I was thinking of something else.  In the amdgpu driver, it uses
#pragma pack(), which Sparse ignores, then since structs aren't
packed the build time assert fails and that's actually what disables
Sparse.

  CHECK   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amdgpu/amdgpu.h):
drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:414:49: error: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"

regards,
dan carpenter

