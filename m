Return-Path: <ksummit+bounces-2763-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2613DD16B35
	for <lists@lfdr.de>; Tue, 13 Jan 2026 06:31:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29B3D302CDFC
	for <lists@lfdr.de>; Tue, 13 Jan 2026 05:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964952F0673;
	Tue, 13 Jan 2026 05:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GtrRp/t2"
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A503B1B6D1A
	for <ksummit@lists.linux.dev>; Tue, 13 Jan 2026 05:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768282258; cv=none; b=Zbvl4g1j13WL3zyWPCXAzvtDNJqjDrc5n9j03j9aVEhpbrkEQJ4bSNROjtcx1dQLGcAaLrCl8Ix3nKACLKUJb7mYbsqvxPirP7CY2aRjcWGBeE83QDA7VIjqa+xHdAmj6sOkmYG0JwJAZalpuGyBkY1G0W4cMSuasp0rVmPcZp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768282258; c=relaxed/simple;
	bh=P/MHFzYAChsov3oSR/JHZIouogUq9c6RwFPwihfamrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qdM6vrR9NCs3gDR9lqIdTFM/D1Uu8sj+fQu0J1KkXldnoAaEZ4Ps/9Vtbd6g2pC3rPb96oY0/F5Tp0TvnFXa0JHLp4OlDk7IUmqtrse77fnVFQ0lSs71YBlHUZYyitg2fXEEYWLMjUF6C3cWgmEkFx6jBFT4LnJzKr4bvgZIc5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GtrRp/t2; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso29129725e9.2
        for <ksummit@lists.linux.dev>; Mon, 12 Jan 2026 21:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768282255; x=1768887055; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9MEnfqkiQJvWopDgU9OJmASAYD/D+Fi+9t27f121isA=;
        b=GtrRp/t2MuOekzXSBD+qLXUi4DyOgD9I99m7zlDYlu9wh0ZKFSIpOMF+lAy1RnUzOd
         2B7ygJH/uZsJKSOQawGEN71Up/mTCn0U89+1wb5uzqL1HY0+t0/UotUA1PhNwZBWzutM
         WM7nCHd++ekODbLHdq/tHcBPCXXhfd6SBpQ+YBdjIBYWyHw4CYgsRMD/pKGRiq6LXoSg
         3oZEyP3J/PTmj/W1Ln+KqTbZ17xvAICDYqsISchy7dAMqz7NFAPk64kzUnJmvvLG9ooO
         /RjugYPcNh/l5ypIpELNGhK/2RqEb1r7YFqwT3t2nvjOLoXXdZq7h+q37q21LIh1x7Gf
         xEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768282255; x=1768887055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9MEnfqkiQJvWopDgU9OJmASAYD/D+Fi+9t27f121isA=;
        b=IJiDOU3Dvs6b0e8oNIRDyWbTpvJqRUHeem5dAQ5Y91ciGo60mFnVK2DWjqoeC2Bh43
         LJykAI86PYqOAnyb07jvQdRU9dRieYGRvukywa9iEMQ4NnliPZHBdRQZPZqN2a6bb8na
         Gyh0DZRwt9LcS7mHJvR1KDpYYR7JKcHfvuAhk1zMzg5hbKmtJ7OAoCwO3ZkHB12wD8bb
         q2QeXKmAm1aIn9zs7TUE6MF45Kk6x3w4mtwsZW4/Al2jJ6fPP+j9SzefrmeQWckrCv7b
         dJsopeFgvOg5TV6bLY9T1GMcSpTkxHqbcstyzG83YU/gNjauY+1tC1LZuEOESaI2A1gD
         61YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFtmo0OXvavMRt4HtuGveLDHWfgnZy+uHvsYYQBlgYiP1J/AZ2Z3ppxDVdNgmWdjvJgjG1WD+L@lists.linux.dev
X-Gm-Message-State: AOJu0YwET0kEEjj+wwicfaLTNJ4ysehxrMyTaKCff+Mf1PTFDZyfgrce
	NWXPxBTlgG22SUtuaiZPTkLs7i9nVwlFAXolOBw8O6qjUK1krZ3cHFR9lrztmCyuvLCM7AHO+a7
	PCuWi3F8=
X-Gm-Gg: AY/fxX4a6Hw9hJabPDag6MqaLOCkIQsJWO1nXOrXRtFeVmvIMZt7mM2ustXOJs2IBEG
	EIwWnEUDFE/2dALS+eum6DqcH4q0dHMs05yIhDZ2hmRbydIyrY6ncUClQmsV4PACPq5qne1+Zr+
	mzEXRQogFnyEzBwo4ZwUWacHkfnqGj7Usu2EccgvoR1d3jNdFUUDVq5OxgObI1XuTjhX5bJXdjE
	Ifif7V5iXt4iTsPKUKO79N+iqrKS1Dq7++8Kp0WDgGj3r15GpZOEJ1bWkVk8Vnww43xtcSqPdK9
	4zylmLEylZlBUlRpEkr4JiBfHPqHBrX+vaL/jrupHKrDE1J//s0eQfDtVlp5+J+mF9hpY/e71sg
	9OcFkrYBY27Hy9LmtZgJiM4XmstD1AqfAqFkxwcys0WX5+/5C402xmBAa7ZU+vTi1y7lV519tC6
	ew3OOSeW6XH0YgI81n
X-Google-Smtp-Source: AGHT+IGDp/W7TK/EM3kXAS4N1aHcAGGZUHegbj9ykfLRgCjS5whOFlSgKwlj8bJYWUxFP6D9YmAxuA==
X-Received: by 2002:a05:600c:1392:b0:477:9cdb:e336 with SMTP id 5b1f17b1804b1-47d84b369cfmr239854465e9.21.1768282255011;
        Mon, 12 Jan 2026 21:30:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f661a03sm403001375e9.13.2026.01.12.21.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 21:30:54 -0800 (PST)
Date: Tue, 13 Jan 2026 08:30:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Simon Glass <simon.glass@canonical.com>,
	NeilBrown <neilb@ownmail.net>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
	workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v5] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <aWXYi35pu9IHf2eE@stanley.mountain>
References: <20260113000612.1133427-1-dave.hansen@linux.intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113000612.1133427-1-dave.hansen@linux.intel.com>

On Mon, Jan 12, 2026 at 04:06:12PM -0800, Dave Hansen wrote:
> +As with all contributions, individual maintainers have discretion to
> +choose how they handle the contribution. For example, they might:
> +
> + - Treat it just like any other contribution.
> + - Reject it outright.
> + - Treat the contribution specially like reviewing with extra scrutiny,
> +   or at a lower priority than human-generated content.
> + - Suggest a better prompt instead of suggesting specific code changes.
> + - Ask for some other special steps, like asking the contributor to
> +   elaborate on how the tool or model was trained.
> + - Ask the submitter to explain in more detail about the contribution
> +   so that the maintainer can be assured that the submitter fully
> +   understands how the code works.
> +
> +If tools permit you to generate a contribution automatically, expect
> +additional scrutiny in proportion to how much of it was generated.
> +
> +As with the output of any tooling, the result may be incorrect or
> +inappropriate. You are expected to understand and to be able to defend
> +everything you submit. If you are unable to do so, then do not submit
> +the resulting changes.
> +
> +If you do so anyway, maintainers are entitled to reject your series
> +without detailed review.

Argh... Flip.  In context, that sounds even more sinister and
threatening than my over the top proposal.  We have to "defend"
everything?  "If you do so anyway" sounds like we're jumping to a
"per my last email" from the get go.  What about:

If tools permit you to generate a contribution automatically, expect
additional scrutiny in proportion to how much of it was generated.

Every kernel patch needs careful review from multiple people.  Please,
don't start the public review process until after you have carefully
reviewed the patches yourself.  If you don't have the necessary
expertise to review kernel code, consider asking for help first before
sending them to the main list.

Ideally, patches would be tested but we understand that that's not
always possible.  Be transparent about how confident we can be that the
changes don't introduce new problems and how they have been tested.

Bug reports especially are very welcome.  Bug reports are more likely
to be dealt with if they can be tied to the individual commit which
introduced them.  With new kinds of warnings, it is better to send
a few at a time at the start to see if they are a real issue or how
they can be improved.

regards,
dan carpenter


