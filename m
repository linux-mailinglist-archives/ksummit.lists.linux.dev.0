Return-Path: <ksummit+bounces-1434-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1F3931C3D
	for <lists@lfdr.de>; Mon, 15 Jul 2024 22:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D64F6281F4B
	for <lists@lfdr.de>; Mon, 15 Jul 2024 20:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE7C136E09;
	Mon, 15 Jul 2024 20:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ViVCwqfG"
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E6C13BAFA
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 20:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721076679; cv=none; b=gmv0VxELaU7mrw1BwLRWDVu951BpBKs5Uf4Wpu1aFm/555+xWlEYivslQhxieDUqY5m1iFEI8/SVmEDiPWVw8tEABlNaNVFFK+/pUAd4HzFZar00pP1afowyyIwvImWMsoIi0XKd7zJoiA9QHSCuWrmlbzbXINnwi4JbS3No+qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721076679; c=relaxed/simple;
	bh=Mln0zw9s6RNOKBIQ6/e67+it898WN3NxDenxtGCqQxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZP7Un8X6bMKCFhKPRE2Ue+XRSyLDyyLovWoNbti+X9Jsleo/+pF0UFS+1h+HHWNaBvYlkJ72Z8Ak7VhXl+FD5FJwKz6eubOAfLH5O0VyNXgCaultDZ73T6mXOKY+7DsQkAeM4xFzGVnumwXSa5lePfAaI+26l8EJ/qXeQvavIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ViVCwqfG; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-70365f905b6so2691769a34.0
        for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 13:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721076677; x=1721681477; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+k4odTidFDPhWYMdkQzAI5zzZsi8dS8CtCSAiik2wQY=;
        b=ViVCwqfGhNstzCi7B+Rg1RmtGmRQdQ72fJAIVBXRjRiqJ/BVgdEflhc2c4ytlyBgPl
         91m3mYFEj6HSydugYw+SMwqDpclm731qbQ+KyYCtMniZ7JS7ox1w+EWZZIB4/APr0PBm
         a3nPTD3EywFtsMcCHyHDchu9s6Clxixg2st7FGTedgL6aenX/vui3m+X18vuyDNPCvT9
         ztGjT9DDYLMcTLjBIwyJmlbTv1eMz77HL+kNDILlcRjK9d/uEU3zJJ0TfsjJQIjImceb
         JV0Kq1FvS+0QL1apgbNk4ak43wUyhETytmifDOUEUWo+cd2Z5HKehE4BdJQziY983Heb
         pcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721076677; x=1721681477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+k4odTidFDPhWYMdkQzAI5zzZsi8dS8CtCSAiik2wQY=;
        b=XuFI99JSr+UFy9bPPMXvaFNcC73jw7v5fZZx+0slo5hvsjzTXaaBL37BsAmaoMlq25
         AwBE0VpEbj6WEmdj2ctS7OPUpcFuhSMMmTGb03fQGW9aDkauBGEZKTguY2koYZITWV2C
         A14Nx5nZJg/SBKrKzrfOhZO3aqVW1qMuHG74Kvtd/cfu20y6n5vnB+ZNd8CY74xq6a/R
         6gqFL5wsTYdu4ZV4nuxr2fTuaUH2jwqPinMkyb+HUHEo2sRAdhAf3EW1ug2qeJ7GgX1G
         bVhemzpzK8iVewQ54nM+K7Pq3JY8U797bwYlma6/DHWLM7tOUzt436+vz8bZIJ5xxzLm
         MlQg==
X-Forwarded-Encrypted: i=1; AJvYcCWbDrOVLvZvQRzwQX5GDYoM49o46swjy1kfZ2wujXKAHxmOeHSQqvEiq+2eo7AphhPbJQQTt5MmiuoRqokVlThGxyR4GVoLsw==
X-Gm-Message-State: AOJu0YwGWD17ZkUh3Pnk5G8nURlmViTlgyyqXJkZymPCLDX+5mwD9lL3
	4yRkDcvrTEQYJo77FY5xrSJNK7oW6OXD+uLyf9MAol7QCBDT9Prk
X-Google-Smtp-Source: AGHT+IE6UolvuA76Iavn0FBx1th7bOm8gJKNZzVqk/4RDa3Y4RNPgLvjqRtRn+Rg5CQMGxE4ViE98A==
X-Received: by 2002:a05:6830:6f85:b0:708:b2f3:5f11 with SMTP id 46e09a7af769-708d99dde07mr367548a34.27.1721076677351;
        Mon, 15 Jul 2024 13:51:17 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:6d45:d4db:b14d:ea69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-78e39920c4bsm3124195a12.84.2024.07.15.13.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 13:51:16 -0700 (PDT)
Date: Mon, 15 Jul 2024 13:51:14 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <ZpWLwsF4XcO6EJr2@google.com>
References: <CAHk-=wjfXLDGBjieQhLRCP2tQnXTYhW2MiY3LWJ=g7QDE1cRyA@mail.gmail.com>
 <ZpQ0soWV6zIpgigf@sashalap>
 <0e6c7c8ed259dcb50631c6fdc3d86d3080bdc6f3.camel@HansenPartnership.com>
 <CAHk-=wjLShGxeGtjRGkjQni+VzWC0yrf34EP0AUn+_zU0u-WeQ@mail.gmail.com>
 <2024071528-cahoots-reacquire-9eab@gregkh>
 <3a357a63f67f3e6aff5e6d020d40b51fa24e0280.camel@linux.ibm.com>
 <ef31a7c7546ef232665760aac98c8d7f20060bcc.camel@linux.ibm.com>
 <202407151434198c3715e9@mail.local>
 <2024071515-zestfully-womankind-1901@gregkh>
 <8a0d05e1-71be-445e-afcf-4764149ea60a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a0d05e1-71be-445e-afcf-4764149ea60a@sirena.org.uk>

On Mon, Jul 15, 2024 at 07:04:34PM +0100, Mark Brown wrote:
> On Mon, Jul 15, 2024 at 04:40:01PM +0200, Greg KH wrote:
> > On Mon, Jul 15, 2024 at 04:34:19PM +0200, Alexandre Belloni wrote:
> 
> > > I'm very surprised that it didn't cross anyone's mind yet that
> > > contributors and maintainers don't bother using Cc: stable because they
> > > don't care about stable for various reasons. So the behaviour is nether
> > > good nor bad and doesn't have to be penalized.
> 
> > Totally true.  The first rule of the stable tree is "it will not put
> > additional burden on any developer or maintainer that doesn't want to
> > participate in it."  So if you don't want to deal with it, wonderful,
> > don't take anything and just don't worry about it.
> 
> FWIW as we've discussed before I stopped adding explicit CCs for the
> most part since AUTOSEL is picking up far more than I ever would so it
> doesn't seem worth the effort to filter which is a variation on what
> Alexandre mentioned.

I am still tagging cc: stable for fixes that I truly believe belong in
stable, but otherwise I let AUTOSEL do whatever it wants because I do
not own stable tree. I however also believe that AUTOSEL picks up much
more than it should. Maybe if "Fixes: " tags commit older than <age> (2
years?) it should ignore such fixes?

Thanks.

-- 
Dmitry

