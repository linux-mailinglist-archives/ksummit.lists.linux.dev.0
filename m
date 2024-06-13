Return-Path: <ksummit+bounces-1258-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D340B907CC7
	for <lists@lfdr.de>; Thu, 13 Jun 2024 21:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1F831C23FA4
	for <lists@lfdr.de>; Thu, 13 Jun 2024 19:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A55514B091;
	Thu, 13 Jun 2024 19:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YdwgWJRn"
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AE6134407
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 19:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718307596; cv=none; b=a/9dsq3lIf9dTrs+eghBjw/QX3iLNLs820Fn7UmVNWIm7uUQBajQvLTz4cmbU+RRrhhNJ4R1pJGDIZMhdxArfM8cHf/oN7CIha4mWga6Nq3jHFbsvdCXLfNt8emCq6IxxeG4KZOR+EA7LASl3uKl6s6yOF9Jp2lcoVaiW1oVB/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718307596; c=relaxed/simple;
	bh=bT8ppMEXPdqRxWbcGJCWwoPeP5uwj6XeUMCHa87JrmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eb8frw6kzJODGdu74jbMQ4c0MvzH/3ibcn9kVyjVEOnzAp5z2MeO5rHTaJnGUBxplmPpvl3A4czsj4d6ckG2Ky2hvz241HrtNKUjRNGBh+5sAKPSiwwzmtl23uK4A9FwbJrv5SqA3ksHPuN9n36T/TScZCMpid9eC4t2bAjbjtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YdwgWJRn; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-35f27eed98aso1273369f8f.2
        for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 12:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718307592; x=1718912392; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+M6I+JwcoIXzHrUHirr13qHAWxZbb11rFCWlmsASdA=;
        b=YdwgWJRn2AdJ12ubOpFOkedYF33eAG1kzTxle6HnyJhYP86dkBrV9pG4E1rOap4sR4
         JeuhEOlCqgHSeIHdqG5Gvd6HLmo6Yt0PzDwxzoefRZjTc1VmcPb6+osLTY485MshocFk
         Tg/hJChOGY6Bpn7wJ9UV7FKeb5dsAiWFAVYEQrb2mgy54JP+DTFkXyfgDOygQSs7mQUc
         Vo9gr8cP37Vt8U9/kaJEtyR5aIHV3NAGyzEqcZ6f/49jU4YRpBKgi+4RAVrGkPnB3GGS
         0yTdPJUcg/iMK5KFyPkJvQG8wIR3irexe7WWS+RkN5/kAZ16j0a7tQA4xXOo5JS90GDE
         gJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718307592; x=1718912392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+M6I+JwcoIXzHrUHirr13qHAWxZbb11rFCWlmsASdA=;
        b=ksd/fHpsb52aDhjCJSqv91Wg6e+36JPCAvCo9EYAy3DK7L3xxcUdmGMgJKBpLkUfoe
         u2b4HSlvgLeMhYW54TMM4kJ7t2q/61aHDOC4cALkaX68WIboT45JIYmdAs6udbStxMi/
         VrG5NtsmvuXNZQ7PdRZRQD3XGbIZC+ipbO1c9LBRQCEULOK8uXad0vx5cvtYUOyW/rbx
         FHBCwliCsEZkiXn137/1OGE9lbm5y/8D+fOMvycT/1oB8nb9/pj+HYC9z/Pjn7KkX2tJ
         8GuEYrojXiSND+cOgHTjaBfT31cufQHl4AeYuPSuuO6SD2UBKmEeI7sSEQjzqDDxA7cg
         oHSA==
X-Forwarded-Encrypted: i=1; AJvYcCUgACKOyoIgucKpaAD2xqX0r1K+CHVUFK2Dp5PhMieluUExULdLmw46iS8jNuROFjhntN3V4MsZf0kXZgZzke2LebPCJ8mu6w==
X-Gm-Message-State: AOJu0YyupQ4bu0GEAVzkUj1WafBhVzY2U3RUHqlejtZhgyijktkLduF4
	MljjKJmtZ/jqT34KnT9ZiJX2NxXP2E/5cTGSYmUPkwWsM2o8rHno8vIbMdjpjhs=
X-Google-Smtp-Source: AGHT+IFUiUMP2ecy0S3YZmXS8a1KInDmGX43Mogsllr+AlnehpLLqgUc0uUl7jxCzR4/fCMYvl+/tA==
X-Received: by 2002:a5d:4b48:0:b0:35f:27b3:1d99 with SMTP id ffacd0b85a97d-3607a75d281mr516038f8f.31.1718307592450;
        Thu, 13 Jun 2024 12:39:52 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509c883sm2531515f8f.29.2024.06.13.12.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 12:39:52 -0700 (PDT)
Date: Thu, 13 Jun 2024 22:39:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jan Kara <jack@suse.cz>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <3226c18c-9f56-4f98-8b12-c51be4a68033@moroto.mountain>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <20240613095917.eeplayyfvl6un56y@quack3>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613095917.eeplayyfvl6un56y@quack3>

On Thu, Jun 13, 2024 at 11:59:17AM +0200, Jan Kara wrote:
> FWIW I (and a few other maintainers) use 'Message-Id' tag to link to
> submission.

These are great.  What I wish is that someone added that to Patchwork.

KTODO: Add Message-Id tag support to patchwork

(KTODO is like a when you say a wish and throw a coin into a fountain
except it doesn't cost you a quarter).

regards,
dan carpenter


