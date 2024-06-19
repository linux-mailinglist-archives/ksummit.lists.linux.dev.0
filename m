Return-Path: <ksummit+bounces-1321-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6E790E53B
	for <lists@lfdr.de>; Wed, 19 Jun 2024 10:09:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26C7DB2140C
	for <lists@lfdr.de>; Wed, 19 Jun 2024 08:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A81A78C7A;
	Wed, 19 Jun 2024 08:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IxrelpRr"
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB8178C68
	for <ksummit@lists.linux.dev>; Wed, 19 Jun 2024 08:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718784535; cv=none; b=VDuuB75bvC0GqmeKAV9BqPGShL5QWf+elIJ8mbvQV7kNUqA6RRm+G6FCYWh6ZE0LAneEI0C2ch/nA794/osztYfsTtAINsXktm+9YQYPqgdojlKh2O/vuRdFKXPG040Ytd7cp5zk3NFfh8rMBkBOkE5pMp5SV9gyASgNPV6Gc9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718784535; c=relaxed/simple;
	bh=vl9KclTpnM+SdGp+CrCX4wdBrh0WCaT2cjnS1mhbu6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FY2WBPEysR8U6nDPN5APytyqFP15ILwkGOy5ccjlWm46HLJIgjIdWMbvFeY30K2gSHjChHcMIU7ruQjW+Rt1fQlfEcQnn+oSd0tsHU5O+xkxPrInisM5R+radfEspMxyFkH6yTrVDPMj4OY+dbEXYqTjjzwZLw3STY7YWOkrBS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IxrelpRr; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ebe40673d8so66717831fa.3
        for <ksummit@lists.linux.dev>; Wed, 19 Jun 2024 01:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718784532; x=1719389332; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aCIcbRqN1/jGnE/uXHAlTtP9P6llAMOVezx7CUwbZqQ=;
        b=IxrelpRrgQmYUOt5fbLqkwV2PFsDfey7rWOA3bYEQTTasL8Fs7JZmIBamkGxIv9m6X
         /KDOZpyQDzuL1CMoVGHu8ZeTR0MxSJPJLPNK6Vpn5NDuO5eEfUWIFQjlF1/WfGV4QOIE
         u8d1J6pjTpWGr83Nj+XHpQsE0DjybHKlqe7ga/ZxyLNri2e6xbB4WzIJTLf2ZEe7HKjE
         Dr3odyyYI2mifUp8bpTnq3VJDZc46sEMacPUxVx7/Ty0mQKIg+fu8Fmf62MGjuhh/RnP
         Zs0/OSnqym9kLL1/Ui6NbiNXUr6ywWCszR0wFdVTD2j8vfUsmbfujHX+fFCqC9Mp9FpN
         yThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718784532; x=1719389332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCIcbRqN1/jGnE/uXHAlTtP9P6llAMOVezx7CUwbZqQ=;
        b=P0Hut8tgjQLGDLSE+KVWhxZbgxGaJXQb1mLqpNMlfKkc3jXaxAlCzo8sveDw2/J+P+
         nVqPLirA+R4/5ztfpw07/JJxxa4M4kjyLkR6tZCd4svIdRgX4psNxiDJcjOa3E6ZOqyk
         P2gySi1z4681473qJQYhgoBO9VHhi5i+bS3prXw2EmT/MYSLUAOy7qr2p77LigafDhsE
         eUD3Jvs1V09EWTI4Pt0kmFgzjjZ0xWmm2MLEyr7qcVxG8fMrmI8RGX7iC9sK5H7Fi0px
         CGCioJaC7M4Efwtq3oL/8qaTE2f1z4fzKq2BlY2HV7clWol+W1bF18ud0wCHRft/wtYI
         xwLw==
X-Forwarded-Encrypted: i=1; AJvYcCXcJw4Nky3mdduU2p3IXy+VF/dj9/zxmntJFNGmGmKjVdXXZZD7uobNdvv6W0oWgR/bTzvZfnL4fS5mkVhVOVVcrIvq1v2j0w==
X-Gm-Message-State: AOJu0Yy6utOB7ja//H16aJAmvbuhjM9nLdfXXc3oeSrO4I5x9DHawQYc
	GbFV42+bslGqndIvXYGA92GiWiJ4tsD6fMs8fua/fnOxJlJS8uTHSUg9eq2nPGA=
X-Google-Smtp-Source: AGHT+IHzpaORTCZz1/7jsEDBtxbwIYMBPRLfAyWcTVqZGOfG4wD12iOFalcqhwT3dzksgJh+y2ozKQ==
X-Received: by 2002:ac2:4578:0:b0:52b:85ba:a278 with SMTP id 2adb3069b0e04-52ccaa62111mr841920e87.31.1718784531869;
        Wed, 19 Jun 2024 01:08:51 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36229be908fsm3478277f8f.38.2024.06.19.01.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 01:08:51 -0700 (PDT)
Date: Wed, 19 Jun 2024 11:08:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: [PATCH 2/2] Documentation: best practices for using Link trailers
Message-ID: <aef741d4-d6e0-41f1-8102-c63a0fc5d7e2@moroto.mountain>
References: <20240618-docs-patch-msgid-link-v1-0-30555f3f5ad4@linuxfoundation.org>
 <20240618-docs-patch-msgid-link-v1-2-30555f3f5ad4@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618-docs-patch-msgid-link-v1-2-30555f3f5ad4@linuxfoundation.org>

On Tue, Jun 18, 2024 at 12:42:11PM -0400, Konstantin Ryabitsev wrote:
> Based on multiple conversations, most recently on the ksummit mailing
> list [1], add some best practices for using the Link trailer, such as:
> 
> - how to use markdown-like bracketed numbers in the commit message to
> indicate the corresponding link
> - when to use lore.kernel.org vs patch.msgid.link domains

You should add something to checkpatch to complain about patch.msgid.link
URLs.  Those URLs should only be added by the committers, not the patch
authors.

regards,
dan carpenter


