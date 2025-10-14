Return-Path: <ksummit+bounces-2519-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F48DBD7D63
	for <lists@lfdr.de>; Tue, 14 Oct 2025 09:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 08A544F1C58
	for <lists@lfdr.de>; Tue, 14 Oct 2025 07:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E9C2D8387;
	Tue, 14 Oct 2025 07:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LkOFU+md"
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC3723B62B
	for <ksummit@lists.linux.dev>; Tue, 14 Oct 2025 07:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426207; cv=none; b=t+QRaF5SHVjrlbROSiYy7ls6Y8WguPinI3NufhkgS9ayzE0srdJ4jC+/5+R/dsud1kAGzBDTtCd+WgdWuRaOTovK5HhnG3exSdxhkOSAFbZ1rj8t8H2F6XHJPnqSs2DSI2jFXeNC/26jwfLI/BGafRx8J3186Mx2TXpQl093ZHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426207; c=relaxed/simple;
	bh=GwMr5JrDGuC/p5DLnAhCVUPnWWDJPOC61F4+KjrTvfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8tApMh2h2Iw1vzdcremwyDPW55C9A0Sx93p9mhMCQpLuxgCiQ1kd481l4e2vcjtUeMm+u/pGOZHG3bGPCBqhLd6x4oBjkKd9M/3zG/RaE3hv3935WZZo8LjXTeJPai8zJ928uB12SOQOCmWKayljCrijMI9KeZxo0/9QgqeF14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LkOFU+md; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46e3a50bc0fso36927955e9.3
        for <ksummit@lists.linux.dev>; Tue, 14 Oct 2025 00:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760426204; x=1761031004; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eae85rP/63NYJPgrkVMftTaX2Aik9xxCRaEXXsQI7sQ=;
        b=LkOFU+mdkyazMf3g7Ik9bt5Wz0hUkmeDyh4Qk04BTiEuxfbQljRoBLQ0DiyH5hjDE2
         xKs7AlFdw3z/yPPjnlAljP4lfbQ3LgZ3sbwexnEw5HA3AFu1DHoXpEacUWxUjgeuMf9S
         9yKYeXIPWZ1Z0q7dUJSek64PzJCqztG5lRrfhUukttUmmtqarwZLRA82rcaAxzwXAkGY
         obxzXguTldKn3qGBUySvFkh7Wr0EWVBE6ryqn+GUVmpzBuiisR310rx8id8NCtwc8yhO
         R0O5d4iTekedZAyRvD1mJGlJUkU9m+ZwYsGEU7Lofk9zjnd01jFTzjQQaHi4XoC+0195
         BdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760426204; x=1761031004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eae85rP/63NYJPgrkVMftTaX2Aik9xxCRaEXXsQI7sQ=;
        b=ItyTwHmDXBxb5T3pjsWoknnHuHWqVporWjiPF7AryG70VhvS00xt0ef3QGAdSk49nd
         eCdVmxIDmPQnUQEKMrqxELXpkoLsix49u6zlYKSqt7xZZ3s30NHgTXA7yzln0QP4CC/4
         2ZN/xaOg9Z6Zu3MwNzSWwM36zIcBf8rWNkKPtAKYaEZs64I/VDgq4mOgPwAW1lVFUKWY
         jQo0rO4RcF5FhekgMFJm7ZKChR4l1N8LjkkydiKr0aqxcIKwUzZS5e/Aw1L6yoQdeVCm
         TY7gG/7wMGs9AotxpUgLdxYr/INIMFO4mg0plLaKedJG+/74tgiq9BTjPQIxAMY1wIfh
         YI9w==
X-Gm-Message-State: AOJu0YzL0B9hiHPgLa1UXS2CmozbadUSlLiGT7zuiryd0O61M1AOZcp+
	j1/H5OjsQElz247A27PE1MWawElHN6cV369yQBxvH9bzi+9vk1Cd4CoGCcAkILJ27OI=
X-Gm-Gg: ASbGncuO2n++FfWDi+x32OZFFIF9PsGmas9TMcu9Q9T0yaus6u8xDV4LwnYbdnsaoN2
	V0sSp3d/9ibhc8RHJYvZV7r4cCxZOXNHADjbsu5++KjqvbxUrPJu4ryeRtHXBGiColwCOqy4csS
	Md7pqIliASLXYjWXgUCakdXVxY9edJFhlhaTBdhvE5H+wMQpY+DmJdVxgKQCC8Nin4uDI5eF4RI
	4gMZrtcm2l4sbEVaDOgbbIjSD2UVx/IOo0h6OQ7ZgcjaszUW/GoqEAskxHIPTqI/yNeDtfybrpy
	yEQ9CmlAZVIHuL9WJnt5D25IEOVdGtEIk1wOVx4kxLimZpbWix494YviBp8rkqR0j8puY15Jdg9
	/uoTOfwC+yasKE5zJ7Y/y1ROuNLO+YRxGr5Ar3Izmlif6gzI4o74l0nEJBkaXJa3HFvUV/Wr4
X-Google-Smtp-Source: AGHT+IErZ9PdMOJGOaWJXSps9x6Zc42aBSsFAxh5Is3yBh7hcrKujRtD0gVsIFWq3rLdW5zbFTNCGg==
X-Received: by 2002:a05:600c:699b:b0:46e:410f:f645 with SMTP id 5b1f17b1804b1-46fa9af8fa5mr174301705e9.21.1760426203930;
        Tue, 14 Oct 2025 00:16:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46fab3d2d65sm142893345e9.2.2025.10.14.00.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 00:16:43 -0700 (PDT)
Date: Tue, 14 Oct 2025 10:16:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chris Mason <clm@meta.com>
Cc: ksummit@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <aO3415vQ7TcOGz8a@stanley.mountain>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>

On Wed, Oct 08, 2025 at 01:04:54PM -0400, Chris Mason wrote:
> There's definitely overlap between the bugs I'm finding and the bugs Dan
> Carpenter finds, so I'm hoping he and I can team up as well.

Sure!

In my experience the big thing when there are two tools that produce
similar output, the frustrating thing is duplicate bug reports.  For
example, Clang generates uninitialized variable warnings and so does
Smatch.  Smatch is a bit more ambitious so it catches more bugs but
also has more false positives.  I always search on lore for the
function name before reporting uninitialized warnings.

> 2) A code indexing tool with MCP server that Claude can use to find
> functions, types, and call chains more effectively.  This makes it more
> likely Claude can trace complex relationships in the code:
> 
> https://github.com/facebookexperimental/semcode
> 
> Asking claude to produce a callgraph for btrfs_search_slot() consumes
> ~444K tokens.  With semcode installed, the same query produces better
> results and uses 25K tokens. (btrfs_search_slot() has a huge callchain)
> 

Smatch has better call trees than any other tools.  The UI might not be
the best, but the data is there in the cross function database.  Where
Smatch falls down is when functions are called from assembly which isn't
often.

regards,
dan carpenter


